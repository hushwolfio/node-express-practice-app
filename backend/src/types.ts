export interface Investigator {
    investigatorId: number;
    name: string;
    uniqueTrait: string;
    boxSetId: number;
}

export interface Trait {
    traitId: number;
    name: string;
}

export interface InvestigatorTrait {
    traitId: number;
    investigatorId: number;
}

export interface Enemy {
    enemyId: number;
    name: string;
    health: number;
    greenDices: number;
    blackDices: number;
    condition: string;
    isMonster: boolean;
    boxSetid: number;
}

export interface OldOne {
    oldOneId: number;
    name: string;
    enemyId: number;
    boxSetId: number;
}

export interface Episode {
    episodeId: number;
    title: string;
    episodeNumber: number;
    boxSetId: number;
}

export interface EnemiesEpisode {
    enemyId: number;
    episodeId: number;
}

export interface BoxSet {
    boxSetId: number;
    name: string;
    description: string;
}

