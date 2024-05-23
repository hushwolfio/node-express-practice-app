import { Pool } from 'pg';
import dotenv from 'dotenv';
import fs from 'fs';

dotenv.config();

const pool = new Pool({
    user: process.env.POSTGRES_USER,
    host: process.env.POSTGRES_HOST,
    database: process.env.POSTGRES_DB,
    password: process.env.POSTGRES_PW,
    port: parseInt(process.env.POSTGRES_PORT || '5432'),
});

const insertData = async (table: string, data: any[]) => {
    const keys = Object.keys(data[0]);
    const values = data.map(obj => `(${keys.map(key => `'${obj[key]}'`).join(', ')})`).join(', ');

    const query = `INSERT INTO ${table} (${keys.join(', ')}) VALUES ${values} ON CONFLICT DO NOTHING`;
    await pool.query(query);
};

const importData = async () => {
    try {
        const data: any[] = JSON.parse(fs.readFileSync('data.json', 'utf8'));

        for (const [table, records] of Object.entries(data)) {
            if (table === 'users' || table === 'orders') {
                await insertData(table, records);
            }
        }

        console.log('Data imported successfully!');
    } catch (error) {
        console.error('Error importing data:', error);
    } finally {
        pool.end();
    }
};

importData();
