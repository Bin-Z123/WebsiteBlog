reate table news(
	id bigint identity primary key not null,
	title nvarchar(255) not null,
	content nvarchar(MAX) not null,
	image varchar(255) null,
	postedDate datetime not null,
	author bigint not null,
	viewCount bigint null,
	categoryId bigint not null,
	status int null,
	home bit null
);



create table categories(
	id bigint identity primary key not null,
	[name] nvarchar(255) null
);

create table users(
	id bigint primary key identity not null,
	username varchar(255) not null,
	password varchar(255) not null,
	fullname nvarchar(255) null,
	birthDay Date null,
	gender bit not null,
	phone int null,
	email varchar(255) not null,
	role bit not null
);

create table newsLetters(
	email varchar(255) not null,
	status bit not null
);
 
alter table news add constraint fk_news foreign key (author) references users(id)

alter table news add constraint fk_news_categoriesId foreign key (categoryId) references categories(id)




INSERT INTO categories (name) VALUES
(N'Văn hóa'),
(N'Pháp luật'),
(N'Thể thao');

INSERT INTO users (username, password, fullname, birthDay, gender, phone, email, role) VALUES
(N'user1', 'password1', N'Nguyễn Văn A', '1990-01-01', 1, 123456789, 'user1@example.com', 1),
(N'user2', 'password2', N'Trần Thị B', '1992-02-02', 0, 987654321, 'user2@example.com', 0),
(N'user3', 'password3', N'Lê Văn C', '1988-03-03', 1, 456123789, 'user3@example.com', 1),
(N'user4', 'password4', N'Phạm Thị D', '1995-04-04', 0, 321654987, 'user4@example.com', 0),
(N'user5', 'password5', N'Ngô Văn E', '1985-05-05', 1, 654789321, 'user5@example.com', 1),
(N'user6', 'password6', N'Đặng Thị F', '1998-06-06', 0, 789456123, 'user6@example.com', 0),
(N'user7', 'password7', N'Nguyễn Văn G', '1991-07-07', 1, 159753486, 'user7@example.com', 1),
(N'user8', 'password8', N'Trần Thị H', '1987-08-08', 0, 951753864, 'user8@example.com', 0),
(N'user9', 'password9', N'Lê Văn I', '1993-09-09', 1, 753159486, 'user9@example.com', 1),
(N'user10', 'password10', N'Phạm Thị J', '1989-10-10', 0, 357159864, 'user10@example.com', 0);

INSERT INTO news (title, content, image, postedDate, author, viewCount, categoryId, status, home) VALUES
(N'Tin tức Văn hóa 1', N'Nội dung tin tức văn hóa 1', 'bantin1.png', GETDATE(), 1, 100, 1, 1, 1),
(N'Tin tức Văn hóa 2', N'Nội dung tin tức văn hóa 2', 'bantin2.png', GETDATE(), 2, 150, 1, 1, 0),
(N'Tin tức Pháp luật 1', N'Nội dung tin tức pháp luật 1', 'bantin3.png', GETDATE(), 3, 200, 2, 1, 1),
(N'Tin tức Pháp luật 2', N'Nội dung tin tức pháp luật 2', 'bantin4.png', GETDATE(), 4, 250, 2, 1, 0),
(N'Tin tức Thể thao 1', N'Nội dung tin tức thể thao 1', 'bantin5.png', GETDATE(), 5, 300, 3, 1, 1),
(N'Tin tức Thể thao 2', N'Nội dung tin tức thể thao 2', 'bantin6.png', GETDATE(), 6, 350, 3, 1, 0),
(N'Tin tức Văn hóa 3', N'Nội dung tin tức văn hóa 3', 'bantin7.png', GETDATE(), 7, 400, 1, 1, 1),
(N'Tin tức Pháp luật 3', N'Nội dung tin tức pháp luật 3', 'bantin8.png', GETDATE(), 8, 450, 2, 1, 0),
(N'Tin tức Thể thao 3', N'Nội dung tin tức thể thao 3', 'bantin9.png', GETDATE(), 9, 500, 3, 1, 1),
(N'Tin tức Văn hóa 4', N'Nội dung tin tức văn hóa 4', 'bantin10.png', GETDATE(), 10, 550, 1, 1, 0);

INSERT INTO newsLetters (email, status) VALUES
(N'newsletter1@example.com', 1),
(N'newsletter2@example.com', 1),
(N'newsletter3@example.com', 0),
(N'newsletter4@example.com', 1),
(N'newsletter5@example.com', 0),
(N'newsletter6@example.com', 1),
(N'newsletter7@example.com', 1),
(N'newsletter8@example.com', 0),
(N'newsletter9@example.com', 1),
(N'newsletter10@example.com', 0);

