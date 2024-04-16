-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2021 at 09:19 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(3) NOT NULL,
  `cat_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'PHP'),
(2, 'JavaScript'),
(11, 'Python3');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(3) NOT NULL,
  `comment_post_id` int(3) NOT NULL,
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_status` varchar(255) NOT NULL,
  `comment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_post_id`, `comment_author`, `comment_email`, `comment_content`, `comment_status`, `comment_date`) VALUES
(1, 1, 'Kunal', 'kunal@gmail.com', 'Hello this is very nice course.', 'Approved', '2021-01-19'),
(5, 2, 'Ash', 'ash@gmail.com', 'Nice Course\r\n', 'Approved', '2021-03-09'),
(6, 3, 'Rahul', 'rahul@gmail.com', 'Trending language every one should go through this language for better career growth and Job Opportunities', 'Approved', '2021-03-09'),
(7, 3, 'Kunal', 'kunal@gmail.com', 'Non Coding Background students can also learn very easily', 'Approved', '2021-03-09'),
(8, 1, 'Ash', 'ash@gmail.com', 'Very Easy to use for non techy people', 'Approved', '2021-03-09'),
(9, 2, 'Rushi', 'rushi@gmail.com', 'Best Language for Frontend Development', 'Approved', '2021-03-09'),
(10, 8, 'Ash', 'ash@gmail.com', 'Best framework built by Facebook', 'Approved', '2021-03-31'),
(11, 8, 'Shreedhar', 'shreedhar@gmail.com', 'Top frontend language used by big firms for developiing frontend ', 'Approved', '2021-03-31'),
(12, 9, 'Kunal', 'kunal@gmail.com', 'Python is a trending language \r\nevery one should learn this ', 'Approved', '2021-03-31'),
(13, 6, 'Rahul', 'rahul@gmail.com', 'Toughest Framework in PHP', 'Approved', '2021-03-31'),
(14, 6, 'Shreedhar', 'shreedhar@gmail.com', 'Great features\r\n\r\n', 'Approved', '2021-03-31'),
(15, 1, 'Ashish', 'ashish@gmail.com', 'hello i m ashish humbre', 'Approved', '2021-05-10');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(3) NOT NULL,
  `post_category_id` int(11) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_author` varchar(255) NOT NULL,
  `post_date` date NOT NULL,
  `post_image` text NOT NULL,
  `post_content` text NOT NULL,
  `post_tags` varchar(255) NOT NULL,
  `post_comment_count` int(11) NOT NULL,
  `post_status` varchar(255) NOT NULL DEFAULT 'draft'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_category_id`, `post_title`, `post_author`, `post_date`, `post_image`, `post_content`, `post_tags`, `post_comment_count`, `post_status`) VALUES
(1, 1, 'CMS Course', 'KP', '2026-03-21', 'CMS_Project.jpg', 'A content management system (CMS) is an application that is used to manage web content, allowing multiple contributors to create, edit and publish. Content in a CMS is typically stored in a database and displayed in a presentation layer based on a set of templates.', 'php, Nilesh, cms', 3, 'published'),
(2, 2, 'JavaScript Course', 'Kunal', '2031-03-21', 'Javascript_Project.jpg', 'JavaScript is a dynamic computer programming language. It is lightweight and most commonly used as a part of web pages, whose implementations allow client-side script to interact with the user and make dynamic pages. It is an interpreted programming language with object-oriented capabilities.', 'Kunal, javascript, Course, class', 2, 'published'),
(6, 9, 'Laravel', 'Rushi', '2031-03-21', 'laravel.png', 'Laravel is a free, open-source PHP web framework, created by Taylor Otwell and intended for the development of web applications following the model–view–controller (MVC) architectural pattern and based on Symfony. The source code of Laravel is hosted on GitHub and licensed under the terms of MIT License.', 'laravel,php,rushi,framework,web', 2, 'published'),
(8, 2, 'React JS', 'Shreedhar', '2031-03-21', 'react.png', 'ReactJS is JavaScript library used for building reusable UI components. According to React official documentation, following is the definition − React is a library for building composable user interfaces. It encourages the creation of reusable UI components, which present data that changes over time.', 'react,frontend,libraries,js,javascript,scripting', 2, 'published'),
(9, 1, 'Python', 'KP', '2031-03-21', 'python.jpg', 'Python is an interpreted, object-oriented, high-level programming language with dynamic semantics. And Its trending in all over world. \r\n', 'python,shreedhar,course,scripting,backend', 1, 'published');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(3) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_firstname` varchar(20) NOT NULL,
  `user_lastname` varchar(20) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_image` text NOT NULL,
  `user_role` varchar(20) NOT NULL,
  `randsalt` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_password`, `user_firstname`, `user_lastname`, `user_email`, `user_image`, `user_role`, `randsalt`) VALUES
(1, 'KunalKP', '1234', 'Kunal', 'Pardeshi', 'kunal@gmail.com', '', 'Admin', ''),
(2, 'Sonu', '1234', 'Rahul', 'Kshatriya', 'rahul@gmail.com', '', 'Admin', ''),
(9, 'Ash', '1234', 'Anosh', 'Kshatriya', 'ash@gmail.com', '', 'Subscriber', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
