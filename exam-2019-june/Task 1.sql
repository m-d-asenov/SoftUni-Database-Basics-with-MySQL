create table branches (
	`id` int auto_increment primary key,
    `name` varchar(30) not null unique
);

create table employees(
	`id` int auto_increment primary key,
    `first_name` varchar(20) not null,
    `last_name` varchar(20) not null,
    `salary` decimal(10,2) not null,
    `started_on` date not null,
    `branch_id` int not null,
    constraint fk_employees_branches
    foreign key (`branch_id`)
    references branches(`id`)
);

create table clients (
	`id` int auto_increment primary key,
    `full_name` varchar(50) not null,
    `age` int not null
);

create table employees_clients (
	`employee_id` int,
    `client_id` int,
    constraint fk_employees_clients_employees
    foreign key (`employee_id`)
    references employees(`id`),
    constraint fk_employees_clients_clients
    foreign key (`client_id`)
    references clients(`id`)
);

create table bank_accounts(
	`id` int auto_increment primary key,
    `account_number` varchar(10) not null,
    `balance` decimal(10,2) not null,
    `client_id` int unique not null,
    constraint fk_bank_accounts_clients
    foreign key (`client_id`)
    references clients(`id`)
);

create table cards(
	`id` int auto_increment primary key,
    `card_number` varchar(19) not null,
    `card_status` varchar(7) not null,
    `bank_account_id` int not null,
    constraint fk_cards_bank_accounts
    foreign key (`bank_account_id`)
    references bank_accounts(`id`) 
);