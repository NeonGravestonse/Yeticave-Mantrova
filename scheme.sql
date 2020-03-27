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

	
	


