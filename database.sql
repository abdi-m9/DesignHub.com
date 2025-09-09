-- Create database
CREATE DATABASE IF NOT EXISTS portfolio_db;
USE portfolio_db;

-- Create contacts table
CREATE TABLE IF NOT EXISTS contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    subject VARCHAR(200) NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('new', 'read', 'replied') DEFAULT 'new',
    INDEX idx_created_at (created_at),
    INDEX idx_status (status)
);

-- Create admin users table (optional for future admin panel)
CREATE TABLE IF NOT EXISTS admin_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(150) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample admin user (password: admin123 - change this!)
INSERT INTO admin_users (username, password, email) VALUES 
('admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin@example.com');

-- Create projects table (for future dynamic project management)
CREATE TABLE IF NOT EXISTS projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    image_url VARCHAR(500),
    project_url VARCHAR(500),
    github_url VARCHAR(500),
    technologies JSON,
    featured BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert sample projects
INSERT INTO projects (title, description, image_url, project_url, github_url, technologies, featured) VALUES
('E-commerce Platform', 'A full-stack e-commerce solution built with PHP and MySQL, featuring user authentication, product management, and secure payment processing.', '/placeholder.svg?height=250&width=400', '#', '#', '["PHP", "MySQL", "JavaScript"]', TRUE),
('Restaurant Website', 'A responsive restaurant website with online reservation system, menu display, and contact forms. Features smooth animations and mobile-first design.', '/placeholder.svg?height=250&width=400', '#', '#', '["HTML", "CSS", "JavaScript"]', TRUE),
('Portfolio Dashboard', 'A dynamic portfolio management system with admin panel for content updates, project showcase, and visitor analytics tracking.', '/placeholder.svg?height=250&width=400', '#', '#', '["PHP", "MySQL", "CSS"]', TRUE);

-- Create skills table (for future dynamic skills management)
CREATE TABLE IF NOT EXISTS skills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    percentage INT NOT NULL CHECK (percentage >= 0 AND percentage <= 100),
    category VARCHAR(50),
    display_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample skills
INSERT INTO skills (name, percentage, category, display_order) VALUES
('HTML/CSS', 95, 'Frontend', 1),
('JavaScript', 90, 'Frontend', 2),
('PHP', 85, 'Backend', 3),
('MySQL', 80, 'Database', 4),
('Responsive Design', 92, 'Frontend', 5);

-- Create videos table (for future dynamic video management)
CREATE TABLE IF NOT EXISTS videos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    thumbnail_url VARCHAR(500),
    video_url VARCHAR(500),
    duration VARCHAR(20),
    views INT DEFAULT 0,
    featured BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample videos
INSERT INTO videos (title, description, thumbnail_url, video_url, featured) VALUES
('Building Responsive Websites', 'Learn how to create responsive websites using HTML, CSS, and JavaScript with practical examples.', '/placeholder.svg?height=200&width=350', '#', TRUE),
('PHP & MySQL Integration', 'Complete guide to connecting PHP with MySQL database for dynamic web applications.', '/placeholder.svg?height=200&width=350', '#', TRUE),
('JavaScript Animations', 'Creating smooth animations and interactive elements using vanilla JavaScript.', '/placeholder.svg?height=200&width=350', '#', TRUE);

-- Create FAQ table (for future dynamic FAQ management)
CREATE TABLE IF NOT EXISTS faqs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question TEXT NOT NULL,
    answer TEXT NOT NULL,
    display_order INT DEFAULT 0,
    active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample FAQs
INSERT INTO faqs (question, answer, display_order) VALUES
('How will a website help my business?', 'A professional website increases your business credibility, expands your reach to potential customers 24/7, and provides a platform to showcase your products or services. It also improves customer engagement and can significantly boost your sales and brand recognition.', 1),
('What technologies do you use for web development?', 'I specialize in HTML, CSS, JavaScript for frontend development, and PHP with MySQL for backend development. This combination allows me to create complete, functional websites with dynamic content management and database integration.', 2),
('How long does it take to build a website?', 'The timeline depends on the complexity of your project. A simple business website typically takes 1-2 weeks, while more complex applications with custom functionality may take 4-8 weeks. I\'ll provide a detailed timeline after understanding your specific requirements.', 3),
('Do you provide website maintenance and support?', 'Yes, I offer ongoing maintenance and support services including content updates, security patches, performance optimization, and technical support. I believe in building long-term relationships with my clients.', 4),
('Will my website be mobile-friendly?', 'All websites I create are fully responsive and mobile-friendly. With mobile traffic accounting for over 50% of web traffic, ensuring your site works perfectly on all devices is a top priority.', 5);

-- Create newsletter subscribers table (optional)
CREATE TABLE IF NOT EXISTS newsletter_subscribers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(150) UNIQUE NOT NULL,
    subscribed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    active BOOLEAN DEFAULT TRUE
);

-- Create site settings table (for future configuration management)
CREATE TABLE IF NOT EXISTS site_settings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    setting_key VARCHAR(100) UNIQUE NOT NULL,
    setting_value TEXT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert default site settings
INSERT INTO site_settings (setting_key, setting_value) VALUES
('site_title', 'Abdirizak Muhidin Mohamed - Web Developer'),
('site_description', 'Professional web developer specializing in HTML, CSS, JavaScript, PHP, and MySQL'),
('contact_email', 'abdirizak@example.com'),
('contact_phone', '+1 234 567 8900'),
('social_facebook', '#'),
('social_twitter', '#'),
('social_linkedin', '#'),
('social_github', '#');
