import axios from 'axios';

const api = axios.create({
    baseURL: '/api',
});

export const fetchData = async () => {
    const response = await api.get('/');
    return response.data;
}

export const importDBData = async () => {
    api.get('/import');
}