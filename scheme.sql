Create Table `categories` (
	`id` int(11) AUTO_INCREMENT PRIMARY KEY, 
	`title` varchar(45) NOT NULL,
	`alias` varchar(15) NOT NULL
) Engine=InnoDB DEFAULT CHARSET=utf8;

CREATE UNIQUE INDEX id ON categories(id);

CREATE Table `lots` (
	`id` int(11) AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(255),
	`description` TEXT,
	`image_url` varchar(100), 	
	`start_price` decimal(10,0),
	`date_create` datetime,
	`expire_date` datetime,
	`user_id` int(11),
	`winner_id` int(11),
	`category_id` int(11),
	`bet_price` int(11)
);
CREATE FULLTEXT INDEX lot_search ON lots(name, description);
CREATE INDEX image_url ON lots(image_url);
CREATE INDEX start_price ON lots(start_price);
CREATE INDEX date_create ON lots(date_create);
CREATE INDEX expire_date ON lots(expire_date);
CREATE INDEX user_id ON lots(user_id);
CREATE INDEX winner_id ON lots(winner_id);
CREATE INDEX category_id ON lots(category_id);
CREATE INDEX bet_price ON lots(bet_price);





CREATE Table `bets` (
	`id` int(11),
	`bet_date` datetime,
	`bet_price` decimal(10,0),
	`user_id` int(11),
	`lot_id` int(11)
);
CREATE UNIQUE INDEX id ON bets(id);
CREATE INDEX price ON bets(price);
CREATE INDEX lot_id ON bets(lot_id);
CREATE INDEX user_id ON bets(user_id);


CREATE Table `users` (
	`id` int(11) AUTO_INCREMENT PRIMARY KEY,
	`username` varchar(45),
	`email` varchar(100),
	`password` varchar(255),
	`avatar` varchar(100),
	`red_date` datetime,
	`contacts` varchar(255)
); 

CREATE UNIQUE INDEX id ON users(id);
CREATE UNIQUE INDEX email ON users(email);

ALTER TABLE `lots`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `start_price` (`start_price`),
  ADD KEY `bet_step` (`bet_step`),
  ADD KEY `winner_id` (`id_winner`),
  ADD KEY `category_id` (`id_category`),
  ADD KEY `date_create` (`date_create`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `expire_date` (`expire_date`);

Alter Table `categories`
Add Primary Key(`id`),
Add UNIQUE Key `title`(`title`),
Add UNIQUE Key `alias`(`alias`);

Alter Table `bets`
Add Primary Key(`id`),
Add Key `user_id`(`user_id`),
Add Key `lot_id`(`lot_id `);

Alter Table `users`
Add Primary Key(`id`),
Add UNIQUE Key `username`(`username`),
Add UNIQUE Key `email`(`email`);

ALTER TABLE `categories`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `lots`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

    ALTER TABLE `bets`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

ALTER TABLE `users`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `bets`
ADD CONSTRAINT  `bets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT  `bets_ibfk_2` FOREIGN KEY (`lot_id`) REFERENCES `lots`(id) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

ALTER TABLE `lots`
ADD CONSTRAINT  `lots_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT  `lots_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT  `lots_ibfk_3` FOREIGN KEY (`winner_id`) REFERENCES `category`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;





