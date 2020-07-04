create database colonial_blog_db;
use colonial_blog_db;

create table categories (
	`id` int auto_increment primary key,
    `category` varchar(30) not null
);

create table articles(
	`id` int auto_increment primary key,
    `title` varchar(50) not null,
    `content` text not null,
    `category_id` int,
    constraint fk_articles_categories
    foreign key (`category_id`)
    references categories(`id`)
);

create table users (
	`id` int auto_increment primary key,
    `username` varchar(30) unique not null,
    `password` varchar(30) not null,
    `email` varchar(50) not null
);

create table users_articles (
	`user_id` int,
    `article_id` int,
    constraint fk_users_articles_users
    foreign key (`user_id`)
    references users(`id`),
    constraint fk_users_articles_articles
    foreign key (`article_id`)
    references articles(`id`)
);


create table comments(
	`id` int auto_increment primary key,
    `comment` varchar(255),
    `article_id` int not null,
    `user_id` int not null,
    constraint fk_comments_articles
    foreign key (`article_id`)
    references articles(`id`),
    constraint fk_comments_users
    foreign key (`user_id`)
    references users(`id`)
);

create table likes(
	`id` int auto_increment primary key,
    `article_id` int,
    `comment_id` int,
    `user_id` int not null,
    constraint fk_likes_articles
    foreign key (`article_id`)
    references articles(`id`),
    constraint fk_likes_comments
    foreign key (`comment_id`)
    references comments(`id`),
    constraint fk_likes_users
    foreign key (`user_id`)
    references users(`id`)
);