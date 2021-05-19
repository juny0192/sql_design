CREATE TABLE `team` (
  `id` int PRIMARY KEY,
  `name` text NOT NULL,
  `players_id` ref
);

CREATE TABLE `players` (
  `id` int PRIMARY KEY,
  `name` text,
  `main_position` text,
  `current_team_id` ref
);

CREATE TABLE `referees` (
  `id` int PRIMARY KEY,
  `name` text
);

CREATE TABLE `matches` (
  `id` int PRIMARY KEY,
  `date` date NOT NULL,
  `referees_id` ref,
  `team1` Ref,
  `team2` Ref,
  `league_id` Ref
);

CREATE TABLE `goals` (
  `id` int PRIMARY KEY,
  `player_id` REF,
  `match_id` Ref
);

CREATE TABLE `league` (
  `id` int PRIMARY KEY,
  `start` date,
  `end` date
);

CREATE TABLE `result` (
  `id` int PRIMARY KEY,
  `team_id` Ref,
  `match_id` Ref,
  `result` text
);

ALTER TABLE `players` ADD FOREIGN KEY (`id`) REFERENCES `team` (`players_id`);

ALTER TABLE `referees` ADD FOREIGN KEY (`id`) REFERENCES `matches` (`referees_id`);

ALTER TABLE `matches` ADD FOREIGN KEY (`team1`) REFERENCES `team` (`id`);

ALTER TABLE `matches` ADD FOREIGN KEY (`team2`) REFERENCES `team` (`id`);

ALTER TABLE `matches` ADD FOREIGN KEY (`id`) REFERENCES `goals` (`match_id`);

ALTER TABLE `players` ADD FOREIGN KEY (`id`) REFERENCES `goals` (`player_id`);

ALTER TABLE `matches` ADD FOREIGN KEY (`league_id`) REFERENCES `league` (`id`);

ALTER TABLE `result` ADD FOREIGN KEY (`team_id`) REFERENCES `team` (`id`);

ALTER TABLE `result` ADD FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`);

ALTER TABLE `team` ADD FOREIGN KEY (`id`) REFERENCES `players` (`current_team_id`);
