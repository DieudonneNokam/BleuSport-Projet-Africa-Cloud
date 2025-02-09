CREATE TABLE `action` (
  `action_id` int(11) NOT NULL auto_increment,
  `action_name` text NOT NULL,
  `action_point` smallint(6) default NULL,
  PRIMARY KEY  (`action_id`)
) ;

CREATE TABLE `action_match` (
  `match_id` int(11) NOT NULL default '0',
  `player_id` int(11) NOT NULL default '0',
  `action_id` int(11) NOT NULL default '0',
  `minute_action` smallint(6) NOT NULL default '0',
  `comment_action` text
) ;

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL auto_increment,
  `image_id` int(11) default NULL,
  `member_add_id` int(11) default NULL,
  `member_edit_id` int(11) default NULL,
  `news_idurl` text NOT NULL,
  `news_subhead` text,
  `news_title` text,
  `news_subtitle` text,
  `news_summary` text,
  `news_text` text,
  `news_ps` text,
  `news_keyword` text,
  `news_release` datetime default NULL,
  `news_visit` int(11) NOT NULL default '0',
  `news_status` int(11) default NULL,
  `news_date_add` datetime default NULL,
  `news_date_edit` datetime default NULL,
  PRIMARY KEY  (`news_id`)
) ;

CREATE TABLE `club` (
  `club_id` int(11) NOT NULL auto_increment,
  `field_id` int(11) NOT NULL default '0',
  `club_name` text NOT NULL,
  `club_abbreviation` varchar(10),
  `club_logo` text, 
  `club_address` text,
  `club_color` text,
  `club_color_alternative` text,
  `club_telephone` text,
  `club_fax` text,
  `club_email` text,
  `club_url` text,
  `club_creation_year` INT(4) DEFAULT NULL,
  `club_comment` text,
  PRIMARY KEY  (`club_id`)
) ;
 

CREATE TABLE `competition` (
  `competition_id` int(11) NOT NULL auto_increment,
  `season_id` int(11) NOT NULL default '0',
  `competition_name` text NOT NULL,
  PRIMARY KEY  (`competition_id`)
) ;


CREATE TABLE `team` (
  `team_id` int(11) NOT NULL auto_increment,
  `team_name_id` int(11) NOT NULL default '0',
  `club_id` int(11) NOT NULL default '0',
  `sex_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`team_id`)
) ;


CREATE TABLE `team_coach` (
  `member_id` int(11) NOT NULL default '0',
  `team_id` int(11) NOT NULL default '0',
  `season_id` int(11) NOT NULL,
  PRIMARY KEY  (`member_id`,`team_id`,`season_id`)
) ;



CREATE TABLE `team_player` (
  `position_id` int(11) NOT NULL default '0',
  `team_id` int(11) NOT NULL default '0',
  `member_id` int(11) NOT NULL default '0',
  `season_id` int(11) NOT NULL,
  `player_number` smallint(6) default NULL,
  `player_captain` tinyint(1) default NULL,
  PRIMARY KEY  (`team_id`,`member_id`,`season_id`)
) ;


CREATE TABLE `team_photo` (
  `team_id` int(11) NOT NULL default '0',
  `season_id` int(11) NOT NULL default '0',
  `photo` TINYTEXT NOT NULL,
  `description` TEXT,
  PRIMARY KEY  (`team_id`,`season_id`)
) ;


CREATE TABLE `field_state` (
  `field_state_id` int(11) NOT NULL auto_increment,
  `field_state_name` text NOT NULL,
  PRIMARY KEY  (`field_state_id`)
) ;



CREATE TABLE `job` (
  `job_id` int(11) NOT NULL auto_increment,
  `job_name` text NOT NULL,
  PRIMARY KEY  (`job_id`)
) ;


CREATE TABLE `forum` (
  `forum_id` int(11) NOT NULL auto_increment,
  `member_id` int(11) NOT NULL default '0',
  `forum_idurl` text NOT NULL,
  `forum_name` text NOT NULL,
  `forum_description` text,
  `forum_order` tinyint NOT NULL,
  `forum_nb_topic` int(11) NOT NULL default '0',
  `forum_nb_message` int(11) NOT NULL default '0',
  `forum_status` int(11) default NULL,
  `forum_date_add` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`forum_id`)
) ;


CREATE TABLE `information` (
  `page_id` int(11) NOT NULL auto_increment,
  `page_parent_id` int(11) default NULL,
  `image_id` int(11) default NULL,
  `member_add_id` int(11) default NULL,
  `member_edit_id` int(11) NOT NULL default '0',
  `page_parent` int(11) NOT NULL default '0',
  `page_idurl` text NOT NULL,
  `page_title` text,
  `page_summary` text,
  `page_text` text,
  `page_keyword` text,
  `page_visit` int(11) NOT NULL default '0',
  `page_status` int(11) default NULL,
  `page_order` int(11) NOT NULL default '0',
  `page_date_add` datetime default NULL,
  `page_date_edit` datetime default NULL,
  PRIMARY KEY  (`page_id`)
) ;



CREATE TABLE `field` (
  `field_id` int(11) NOT NULL auto_increment,
  `field_name` text NOT NULL,
  `field_address` text,
  `field_post_code` text,
  `field_city` text,
  `field_number_seat` int(11) default NULL,
  `field_size` TINYTEXT,
  `field_photo` TINYTEXT,  
  PRIMARY KEY  (`field_id`)
) ;



CREATE TABLE `match` (
  `match_id` int(11) NOT NULL auto_increment,
  `club_visitor_id` int(11) NOT NULL default '0',
  `club_home_id` int(11) NOT NULL default '0',
  `team_visitor_id` int(11) default NULL,
  `team_home_id` int(11) default NULL,
  `season_id` int(11) NOT NULL,
  `competition_id` int(11) NOT NULL default '0',
  `round_id` int(11) NOT NULL,
  `field_state_id` int(11) NOT NULL default '0',
  `field_id` int(11) NOT NULL default '0',
  `weather_id` int(11) NOT NULL default '0',
  `match_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `match_group` text NOT NULL,
  `match_day` tinyint(4) NOT NULL,
  `match_penality_home` tinyint(4) NOT NULL,
  `match_penality_visitor` tinyint(4) NOT NULL,
  `match_score_home` mediumint(6) default NULL,
  `match_score_visitor` mediumint(6) default NULL,
  `match_spectators` int(11) default NULL,
  `match_comment` text,
  PRIMARY KEY  (`match_id`)
) ;


CREATE TABLE `match_referee` (
  `match_id` int(11) NOT NULL default '0',
  `member_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`match_id`,`member_id`)
) ;



CREATE TABLE `match_player` (
  `match_id` int(11) NOT NULL default '0',
  `player_in_id` int(11) NOT NULL default '0',
  `player_out_id` int(11) NOT NULL default '0',
  `minute_in` tinyint(4) NOT NULL default '0',
  `minute_out` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`match_id`,`player_in_id`,`minute_in`)
) ;


CREATE TABLE `match_period` (
  `match_id` int(11) NOT NULL default '0',
  `period_id` int(11) NOT NULL default '0',
  `score_home` smallint(6) default NULL,
  `score_visitor` smallint(6) default NULL,
  PRIMARY KEY  (`match_id`,`period_id`)
) ;


CREATE TABLE `match_stats` (
  `match_id` int(11) NOT NULL default '0',
  `stats_id` int(11) NOT NULL default '0',
  `value_home` int(11) NOT NULL default '0',
  `value_visitor` int(11) NOT NULL default '0',
  PRIMARY KEY  (`match_id`,`stats_id`)
) ;


CREATE TABLE `match_stats_player` (
  `match_id` int(11) NOT NULL default '0',
  `stats_player_id` int(11) NOT NULL default '0',
  `member_id` int(11) NOT NULL default '0',
  `value` int(11) NOT NULL default '0',
  PRIMARY KEY  (`match_id`,`stats_player_id`,`member_id`)
) ;


CREATE TABLE `group` (
  `group_id` int(11) NOT NULL,
  `group_name` text NOT NULL,
  `group_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `group`
--

INSERT INTO `group` (`group_id`, `group_name`, `group_description`) VALUES
(1, 'Visitors', NULL),
(2, 'Members', NULL),
(3, 'Admin', NULL),
(4, 'Super admin', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `group_right`
--

CREATE TABLE `group_right` (
  `group_id` int(11) NOT NULL DEFAULT 0,
  `right_id` varchar(30) NOT NULL,
  `value` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `member` (
  `member_id` int(11) NOT NULL auto_increment,
  `country_id` int(11) NOT NULL default '0',
  `sex_id` int(11) NOT NULL default '0',
  `level_id` int(11) NOT NULL default '0',
  `member_lastname` text NOT NULL,
  `member_firstname` text NOT NULL,
  `member_email` varchar(100) default NULL,
  `member_date_birth` date default NULL,
  `member_place_birth` TINYTEXT,
  `member_size` TINYTEXT DEFAULT NULL,
  `member_weight` TINYTEXT DEFAULT NULL,
  `member_comment` text,
  `member_login` varchar(100) default NULL,
  `member_pass` varchar(100) default NULL,
  `member_description` text NOT NULL,
  `member_photo` text NOT NULL,  
  `member_avatar` text NOT NULL,
  `member_valid` tinyint(1) NOT NULL default '0',
  `member_key` varchar(100) NOT NULL default '',
  `member_status` tinyint(1) NOT NULL default '0',
  `member_connection` smallint(6) NOT NULL default '0',
  `member_date_connection` datetime NOT NULL default '0000-00-00 00:00:00',
  `member_date_registration` DATETIME NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`member_id`)
) ;



CREATE TABLE `member_club` (
  `club_id` int(11) NOT NULL default '0',
  `member_id` int(11) NOT NULL default '0',
  `season_id` int(11) NOT NULL,
  PRIMARY KEY  (`club_id`,`member_id`,`season_id`)
) ;



CREATE TABLE `member_job` (
  `job_id` int(11) NOT NULL default '0',
  `member_id` int(11) NOT NULL default '0',
  `season_id` int(11) NOT NULL,
  PRIMARY KEY  (`job_id`,`member_id`,`season_id`)
) ;


CREATE TABLE `weather` (
  `weather_id` int(11) NOT NULL auto_increment,
  `weather_name` text NOT NULL,
  PRIMARY KEY  (`weather_id`)
) ;



CREATE TABLE `level` (
  `level_id` int(11) NOT NULL auto_increment,
  `level_name` text NOT NULL,
  PRIMARY KEY  (`level_id`)
) ;



CREATE TABLE `team_name` (
  `team_name_id` int(11) NOT NULL auto_increment,
  `team_name_name` text NOT NULL,
  `team_name_order` tinyint(4) NOT NULL,
  PRIMARY KEY  (`team_name_id`)
) ;


CREATE TABLE `country` (
  `country_id` int(11) NOT NULL auto_increment,
  `country_name` text NOT NULL,
  PRIMARY KEY  (`country_id`)
) ;


CREATE TABLE `period` (
  `period_id` int(11) NOT NULL auto_increment,
  `period_name` text NOT NULL,
  `period_order` tinyint(4) default NULL,
  `period_length` tinyint(4) default NULL,
  `period_required` tinyint(1) default NULL,
  PRIMARY KEY  (`period_id`)
) ;



CREATE TABLE `position` (
  `position_id` int(11) NOT NULL auto_increment,
  `position_name` text NOT NULL,
  `position_order` TINYINT NOT NULL,
  PRIMARY KEY  (`position_id`)
) ;


CREATE TABLE `round` (
  `round_id` int(11) NOT NULL auto_increment,
  `competition_id` int(11) NOT NULL default '0',
  `round_name` text NOT NULL,
  `round_order` tinyint(4) NOT NULL default '0',
  `round_standings` tinyint(1) default NULL,
  `point_win_at_home` tinyint(4) default NULL,
  `point_win_away` tinyint(4) default NULL,
  `point_tie_at_home` tinyint(4) default NULL,
  `point_tie_away` tinyint(4) default NULL,
  `point_defeat_at_home` tinyint(4) default NULL,
  `point_defeat_away` tinyint(4) default NULL,
  `order_team` tinyint(4) default NULL,
  `order_team_egality` tinyint(4) default NULL,
  `round_group` tinyint(4) default NULL,
  `round_day` tinyint(4) default NULL,
  PRIMARY KEY  (`round_id`)
) ;



CREATE TABLE `season` (
  `season_id` int(11) NOT NULL auto_increment,
  `season_name` text NOT NULL,
  `season_abbreviation` varchar(10) default NULL,
  `season_date_start` date default NULL,
  `season_date_end` date default NULL,
  PRIMARY KEY  (`season_id`)
) ;



CREATE TABLE `sex` (
  `sex_id` int(11) NOT NULL auto_increment,
  `sex_name` text NOT NULL,
  `sex_abbreviation` text NOT NULL,
  PRIMARY KEY  (`sex_id`)
) ;



CREATE TABLE `stats` (
  `stats_id` int(11) NOT NULL auto_increment,
  `stats_name` text NOT NULL,
  `stats_abbreviation` tinytext NOT NULL,
  `stats_code` text NOT NULL default '',
  `stats_formula` text NOT NULL,
  `stats_order` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`stats_id`)
) ;



CREATE TABLE `stats_player` (
  `stats_player_id` int(11) NOT NULL auto_increment,
  `stats_player_name` text NOT NULL,
  `stats_player_abbreviation` tinytext NOT NULL,
  `stats_player_code` text NOT NULL default '',
  `stats_player_formula` text NOT NULL,
  `stats_player_order` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`stats_player_id`)
) ;


INSERT INTO `group` (group_id,group_name) VALUES 
(1,'Visitors'), 
(2,'Members'), 
(3,'Admin'), 
(4,'Super admin') ;

INSERT INTO `group_right` (group_id,right_id,value) VALUES 
(1,'view_news',1),
(1,'news_list',1),
(1,'add_news',0),
(1,'edit_news',0),
(1,'delete_news',0),
(1,'view_information',1),
(1,'information_list',1),
(1,'add_information',0),
(1,'edit_information',0),
(1,'delete_information',0),
(1,'forum_list',1),
(1,'add_forum',0),
(1,'edit_forum',0),
(1,'delete_forum',0),
(1,'edit_message',0),
(1,'delete_message',0),
(1,'view_club',1),
(1,'club_list',1),
(1,'add_club',0),
(1,'edit_club',0),
(1,'delete_club',0),
(1,'import_club',0),
(1,'view_team',1),
(1,'team_list',1),
(1,'add_team',0),
(1,'edit_team',0),
(1,'delete_team',0),
(1,'team_coach_list',1),
(1,'team_player_list',1),
(1,'position_list',0),
(1,'team_name_list',0),
(1,'view_competition',1),
(1,'competition_list',1),
(1,'add_competition',0),
(1,'edit_competition',0),
(1,'delete_competition',0),
(1,'season_list',0),
(1,'view_match',1),
(1,'match_list',1),
(1,'add_match',0),
(1,'edit_match',0),
(1,'delete_match',0),
(1,'import_match',0),
(1,'action_list',0),
(1,'field_state_list',0),
(1,'period_list',0),
(1,'weather_list',0),
(1,'standings',1),
(1,'stats_player',1),
(1,'stats_list',0),
(1,'stats_player_list',0),
(1,'view_field',1),
(1,'field_list',1),
(1,'add_field',0),
(1,'edit_field',0),
(1,'delete_field',0),
(1,'view_member',1),
(1,'member_list',1),
(1,'member_job_list',1),
(1,'referee_list',1),
(1,'add_member',0),
(1,'edit_member',0),
(1,'delete_member',0),
(1,'import_member',0),
(1,'registration',1),
(1,'forgot_pass',1),
(1,'home_member',0),
(1,'profile',0),
(1,'registration_list',0),
(1,'registration_validation',0),
(1,'country_list',0),
(1,'job_list',0),
(1,'level_list',0),
(1,'sex_list',0),
(1,'group_list',0),
(1,'home',0),
(1,'admin',0),
(1,'configuration',0),
(1,'menu_management',0),
(1,'right_management',0),
(1,'plugin_management',0),
(1,'add_file',0),
(1,'delete_file',0),
(1,'add_folder',0) ;

INSERT INTO `group_right` (group_id,right_id,value) VALUES 
(2,'view_news',1),
(2,'news_list',1),
(2,'add_news',0),
(2,'edit_news',0),
(2,'delete_news',0),
(2,'view_information',1),
(2,'information_list',1),
(2,'add_information',0),
(2,'edit_information',0),
(2,'delete_information',0),
(2,'forum_list',1),
(2,'add_forum',0),
(2,'edit_forum',0),
(2,'delete_forum',0),
(2,'edit_message',0),
(2,'delete_message',0),
(2,'view_club',1),
(2,'club_list',1),
(2,'add_club',0),
(2,'edit_club',0),
(2,'delete_club',0),
(2,'import_club',0),
(2,'view_team',1),
(2,'team_list',1),
(2,'add_team',0),
(2,'edit_team',0),
(2,'delete_team',0),
(2,'team_coach_list',1),
(2,'team_player_list',1),
(2,'position_list',0),
(2,'team_name_list',0),
(2,'view_competition',1),
(2,'competition_list',1),
(2,'add_competition',0),
(2,'edit_competition',0),
(2,'delete_competition',0),
(2,'season_list',0),
(2,'view_match',1),
(2,'match_list',1),
(2,'add_match',0),
(2,'edit_match',0),
(2,'delete_match',0),
(2,'import_match',0),
(2,'action_list',0),
(2,'field_state_list',0),
(2,'period_list',0),
(2,'weather_list',0),
(2,'standings',1),
(2,'stats_player',1),
(2,'stats_list',0),
(2,'stats_player_list',0),
(2,'view_field',1),
(2,'field_list',1),
(2,'add_field',0),
(2,'edit_field',0),
(2,'delete_field',0),
(2,'view_member',1),
(2,'member_list',1),
(2,'member_job_list',1),
(2,'referee_list',1),
(2,'add_member',0),
(2,'edit_member',0),
(2,'delete_member',0),
(2,'import_member',0),
(2,'registration',0),
(2,'forgot_pass',0),
(2,'home_member',1),
(2,'profile',1),
(2,'registration_list',0),
(2,'registration_validation',0),
(2,'country_list',0),
(2,'job_list',0),
(2,'level_list',0),
(2,'sex_list',0),
(2,'group_list',0),
(2,'home',0),
(2,'admin',0),
(2,'configuration',0),
(2,'menu_management',0),
(2,'right_management',0),
(2,'plugin_management',0),
(2,'add_file',0),
(2,'delete_file',0),
(2,'add_folder',0) ;

INSERT INTO `group_right` (group_id,right_id,value) VALUES 
(3,'view_news',1),
(3,'news_list',1),
(3,'add_news',1),
(3,'edit_news',1),
(3,'delete_news',0),
(3,'view_information',1),
(3,'information_list',1),
(3,'add_information',1),
(3,'edit_information',1),
(3,'delete_information',0),
(3,'forum_list',1),
(3,'add_forum',1),
(3,'edit_forum',1),
(3,'delete_forum',0),
(3,'edit_message',1),
(3,'delete_message',0),
(3,'view_club',1),
(3,'club_list',1),
(3,'add_club',1),
(3,'edit_club',1),
(3,'delete_club',0),
(3,'import_club',0),
(3,'view_team',1),
(3,'team_list',1),
(3,'add_team',1),
(3,'edit_team',1),
(3,'delete_team',0),
(3,'team_coach_list',1),
(3,'team_player_list',1),
(3,'position_list',0),
(3,'team_name_list',0),
(3,'view_competition',1),
(3,'competition_list',1),
(3,'add_competition',1),
(3,'edit_competition',1),
(3,'delete_competition',0),
(3,'season_list',0),
(3,'view_match',1),
(3,'match_list',1),
(3,'add_match',1),
(3,'edit_match',1),
(3,'delete_match',0),
(3,'import_match',0),
(3,'action_list',0),
(3,'field_state_list',0),
(3,'period_list',0),
(3,'weather_list',0),
(3,'standings',1),
(3,'stats_player',1),
(3,'stats_list',0),
(3,'stats_player_list',0),
(3,'view_field',1),
(3,'field_list',1),
(3,'add_field',1),
(3,'edit_field',1),
(3,'delete_field',0),
(3,'view_member',1),
(3,'member_list',1),
(3,'member_job_list',1),
(3,'referee_list',1),
(3,'add_member',1),
(3,'edit_member',1),
(3,'delete_member',0),
(3,'import_member',0),
(3,'registration',0),
(3,'forgot_pass',0),
(3,'home_member',1),
(3,'profile',1),
(3,'registration_list',1),
(3,'registration_validation',1),
(3,'country_list',0),
(3,'job_list',0),
(3,'level_list',0),
(3,'sex_list',0),
(3,'group_list',0),
(3,'home',1),
(3,'admin',1),
(3,'configuration',0),
(3,'menu_management',0),
(3,'right_management',0),
(3,'plugin_management',0),
(3,'add_file',1),
(3,'delete_file',0),
(3,'add_folder',1) ;

INSERT INTO `group_right` (group_id,right_id,value) VALUES 
(4,'view_news',1),
(4,'news_list',1),
(4,'add_news',1),
(4,'edit_news',1),
(4,'delete_news',1),
(4,'view_information',1),
(4,'information_list',1),
(4,'add_information',1),
(4,'edit_information',1),
(4,'delete_information',1),
(4,'forum_list',1),
(4,'add_forum',1),
(4,'edit_forum',1),
(4,'delete_forum',1),
(4,'edit_message',1),
(4,'delete_message',1),
(4,'view_club',1),
(4,'club_list',1),
(4,'add_club',1),
(4,'edit_club',1),
(4,'delete_club',1),
(4,'import_club',1),
(4,'view_team',1),
(4,'team_list',1),
(4,'add_team',1),
(4,'edit_team',1),
(4,'delete_team',1),
(4,'team_coach_list',1),
(4,'team_player_list',1),
(4,'position_list',1),
(4,'team_name_list',1),
(4,'view_competition',1),
(4,'competition_list',1),
(4,'add_competition',1),
(4,'edit_competition',1),
(4,'delete_competition',1),
(4,'season_list',1),
(4,'view_match',1),
(4,'match_list',1),
(4,'add_match',1),
(4,'edit_match',1),
(4,'delete_match',1),
(4,'import_match',1),
(4,'action_list',1),
(4,'field_state_list',1),
(4,'period_list',1),
(4,'weather_list',1),
(4,'standings',1),
(4,'stats_player',1),
(4,'stats_list',1),
(4,'stats_player_list',1),
(4,'view_field',1),
(4,'field_list',1),
(4,'add_field',1),
(4,'edit_field',1),
(4,'delete_field',1),
(4,'view_member',1),
(4,'member_list',1),
(4,'member_job_list',1),
(4,'referee_list',1),
(4,'add_member',1),
(4,'edit_member',1),
(4,'delete_member',1),
(4,'import_member',1),
(4,'registration',1),
(4,'forgot_pass',1),
(4,'home_member',1),
(4,'profile',1),
(4,'registration_list',1),
(4,'registration_validation',1),
(4,'country_list',1),
(4,'job_list',1),
(4,'level_list',1),
(4,'sex_list',1),
(4,'group_list',1),
(4,'home',1),
(4,'admin',1),
(4,'configuration',1),
(4,'menu_management',1),
(4,'right_management',1),
(4,'plugin_management',1),
(4,'add_file',1),
(4,'delete_file',1),
(4,'add_folder',1) ;


-- Index pour les tables déchargées
--

--
-- Index pour la table `action`
--
ALTER TABLE `action`
  ADD PRIMARY KEY (`action_id`);

--
-- Index pour la table `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`club_id`);

--
-- Index pour la table `competition`
--
ALTER TABLE `competition`
  ADD PRIMARY KEY (`competition_id`);

--
-- Index pour la table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Index pour la table `field`
--
ALTER TABLE `field`
  ADD PRIMARY KEY (`field_id`);

--
-- Index pour la table `field_state`
--
ALTER TABLE `field_state`
  ADD PRIMARY KEY (`field_state_id`);

--
-- Index pour la table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`group_id`);

--
-- Index pour la table `group_right`
--
ALTER TABLE `group_right`
  ADD PRIMARY KEY (`group_id`,`right_id`);

--
-- Index pour la table `information`
--
ALTER TABLE `information`
  ADD PRIMARY KEY (`page_id`);

--
-- Index pour la table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`job_id`);

--
-- Index pour la table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`level_id`);

--
-- Index pour la table `match_period`
--
ALTER TABLE `match_period`
  ADD PRIMARY KEY (`match_id`,`period_id`);

--
-- Index pour la table `match_player`
--
ALTER TABLE `match_player`
  ADD PRIMARY KEY (`match_id`,`player_in_id`,`minute_in`);

--
-- Index pour la table `match_referee`
--
ALTER TABLE `match_referee`
  ADD PRIMARY KEY (`match_id`,`member_id`);

--
-- Index pour la table `match_stats`
--
ALTER TABLE `match_stats`
  ADD PRIMARY KEY (`match_id`,`stats_id`);

--
-- Index pour la table `match_stats_player`
--
ALTER TABLE `match_stats_player`
  ADD PRIMARY KEY (`match_id`,`stats_player_id`,`member_id`);

--
-- Index pour la table `member_club`
--
ALTER TABLE `member_club`
  ADD PRIMARY KEY (`club_id`,`member_id`,`season_id`);

--
-- Index pour la table `member_job`
--
ALTER TABLE `member_job`
  ADD PRIMARY KEY (`job_id`,`member_id`,`season_id`);

--
-- Index pour la table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

--
-- Index pour la table `period`
--
ALTER TABLE `period`
  ADD PRIMARY KEY (`period_id`);

--
-- Index pour la table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`position_id`);

--
-- Index pour la table `round`
--
ALTER TABLE `round`
  ADD PRIMARY KEY (`round_id`);

--
-- Index pour la table `season`
--
ALTER TABLE `season`
  ADD PRIMARY KEY (`season_id`);

--
-- Index pour la table `sex`
--
ALTER TABLE `sex`
  ADD PRIMARY KEY (`sex_id`);

--
-- Index pour la table `stats`
--
ALTER TABLE `stats`
  ADD PRIMARY KEY (`stats_id`);

--
-- Index pour la table `stats_player`
--
ALTER TABLE `stats_player`
  ADD PRIMARY KEY (`stats_player_id`);

--
-- Index pour la table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`team_id`);

--
-- Index pour la table `team_coach`
--
ALTER TABLE `team_coach`
  ADD PRIMARY KEY (`member_id`,`team_id`,`season_id`);

--
-- Index pour la table `team_name`
--
ALTER TABLE `team_name`
  ADD PRIMARY KEY (`team_name_id`);

--
-- Index pour la table `team_photo`
--
ALTER TABLE `team_photo`
  ADD PRIMARY KEY (`team_id`,`season_id`);

--
-- Index pour la table `team_player`
--
ALTER TABLE `team_player`
  ADD PRIMARY KEY (`team_id`,`member_id`,`season_id`);

--
-- Index pour la table `weather`
--
ALTER TABLE `weather`
  ADD PRIMARY KEY (`weather_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `action`
--
ALTER TABLE `action`
  MODIFY `action_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `club`
--
ALTER TABLE `club`
  MODIFY `club_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `competition`
--
ALTER TABLE `competition`
  MODIFY `competition_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `field`
--
ALTER TABLE `field`
  MODIFY `field_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `field_state`
--
ALTER TABLE `field_state`
  MODIFY `field_state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `group`
--
ALTER TABLE `group`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `information`
--
ALTER TABLE `information`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `job`
--
ALTER TABLE `job`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `level`
--
ALTER TABLE `level`
  MODIFY `level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `period`
--
ALTER TABLE `period`
  MODIFY `period_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `position`
--
ALTER TABLE `position`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `round`
--
ALTER TABLE `round`
  MODIFY `round_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `season`
--
ALTER TABLE `season`
  MODIFY `season_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sex`
--
ALTER TABLE `sex`
  MODIFY `sex_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `stats`
--
ALTER TABLE `stats`
  MODIFY `stats_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `stats_player`
--
ALTER TABLE `stats_player`
  MODIFY `stats_player_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `team`
--
ALTER TABLE `team`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `team_name`
--
ALTER TABLE `team_name`
  MODIFY `team_name_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `weather`
--
ALTER TABLE `weather`
  MODIFY `weather_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
