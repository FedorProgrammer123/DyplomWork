USE [master]
GO
/****** Object:  Database [DyplomWork]    Script Date: 14.01.2025 4:20:12 ******/
CREATE DATABASE [DyplomWork]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DyplomWork', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DyplomWork.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DyplomWork_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DyplomWork_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DyplomWork] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DyplomWork].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DyplomWork] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DyplomWork] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DyplomWork] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DyplomWork] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DyplomWork] SET ARITHABORT OFF 
GO
ALTER DATABASE [DyplomWork] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DyplomWork] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DyplomWork] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DyplomWork] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DyplomWork] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DyplomWork] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DyplomWork] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DyplomWork] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DyplomWork] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DyplomWork] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DyplomWork] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DyplomWork] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DyplomWork] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DyplomWork] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DyplomWork] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DyplomWork] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DyplomWork] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DyplomWork] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DyplomWork] SET  MULTI_USER 
GO
ALTER DATABASE [DyplomWork] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DyplomWork] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DyplomWork] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DyplomWork] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DyplomWork] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DyplomWork] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DyplomWork] SET QUERY_STORE = ON
GO
ALTER DATABASE [DyplomWork] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DyplomWork]
GO
/****** Object:  Table [dbo].[AnswerOption]    Script Date: 14.01.2025 4:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnswerOption](
	[answerOptionId] [int] IDENTITY(1,1) NOT NULL,
	[text] [text] NOT NULL,
	[isCorrectId] [int] NOT NULL,
	[questionId] [int] NOT NULL,
 CONSTRAINT [PK_AnswerOption] PRIMARY KEY CLUSTERED 
(
	[answerOptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 14.01.2025 4:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[attendanceId] [int] IDENTITY(1,1) NOT NULL,
	[studentId] [int] NOT NULL,
	[lessonId] [int] NOT NULL,
	[is_present] [nvarchar](350) NOT NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[attendanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CorrectAnswer]    Script Date: 14.01.2025 4:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CorrectAnswer](
	[IDCorrect] [int] NOT NULL,
	[IsCorrect] [nvarchar](350) NOT NULL,
 CONSTRAINT [PK_CorrectAnswer] PRIMARY KEY CLUSTERED 
(
	[IDCorrect] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 14.01.2025 4:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[courseId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](350) NOT NULL,
	[description] [text] NOT NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NOT NULL,
	[teacherId] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[courseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 14.01.2025 4:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[lessonId] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[time] [time](7) NOT NULL,
	[topicId] [int] NOT NULL,
	[duration] [time](7) NOT NULL,
	[courseId] [int] NOT NULL,
 CONSTRAINT [PK_Lesson] PRIMARY KEY CLUSTERED 
(
	[lessonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 14.01.2025 4:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[questionId] [int] IDENTITY(1,1) NOT NULL,
	[text] [text] NOT NULL,
	[type] [nvarchar](350) NOT NULL,
	[testId] [int] NOT NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[questionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 14.01.2025 4:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[IDRole] [int] IDENTITY(1,1) NOT NULL,
	[Role] [nvarchar](350) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[IDRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentAnswer]    Script Date: 14.01.2025 4:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentAnswer](
	[answerId] [int] IDENTITY(1,1) NOT NULL,
	[resultId] [int] NOT NULL,
	[questionId] [int] NOT NULL,
	[answerOptionId] [int] NOT NULL,
 CONSTRAINT [PK_StudentAnswer] PRIMARY KEY CLUSTERED 
(
	[answerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test]    Script Date: 14.01.2025 4:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[testId] [int] IDENTITY(1,1) NOT NULL,
	[titleId] [int] NOT NULL,
	[description] [text] NOT NULL,
	[maxScore] [int] NOT NULL,
	[time_limit] [time](7) NOT NULL,
	[courseId] [int] NOT NULL,
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[testId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestResult]    Script Date: 14.01.2025 4:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestResult](
	[result_id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NOT NULL,
	[test_id] [int] NOT NULL,
	[score] [int] NOT NULL,
	[datetime] [datetime] NULL,
 CONSTRAINT [PK__TestResu__AFB3C316F0413FFF] PRIMARY KEY CLUSTERED 
(
	[result_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TitleTest]    Script Date: 14.01.2025 4:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TitleTest](
	[IDTitle] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](350) NOT NULL,
 CONSTRAINT [PK_TitleTest] PRIMARY KEY CLUSTERED 
(
	[IDTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 14.01.2025 4:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[IDTopic] [int] IDENTITY(1,1) NOT NULL,
	[Topic] [nvarchar](350) NOT NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[IDTopic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14.01.2025 4:20:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[studentId] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](350) NOT NULL,
	[lastName] [nvarchar](350) NOT NULL,
	[email] [varchar](350) NOT NULL,
	[password] [varchar](350) NOT NULL,
	[groupNumber] [int] NULL,
	[courseYear] [int] NULL,
	[Role] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[studentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AnswerOption] ON 

INSERT [dbo].[AnswerOption] ([answerOptionId], [text], [isCorrectId], [questionId]) VALUES (1, N'<body>, <div>, <script>', 2, 10)
INSERT [dbo].[AnswerOption] ([answerOptionId], [text], [isCorrectId], [questionId]) VALUES (2, N'<meta>, <link>, <style>', 1, 10)
INSERT [dbo].[AnswerOption] ([answerOptionId], [text], [isCorrectId], [questionId]) VALUES (3, N'float: center;', 2, 3)
INSERT [dbo].[AnswerOption] ([answerOptionId], [text], [isCorrectId], [questionId]) VALUES (4, N'margin: 0 auto;', 1, 3)
INSERT [dbo].[AnswerOption] ([answerOptionId], [text], [isCorrectId], [questionId]) VALUES (5, N'O(log n)', 1, 7)
INSERT [dbo].[AnswerOption] ([answerOptionId], [text], [isCorrectId], [questionId]) VALUES (6, N'O(n^2)', 2, 7)
INSERT [dbo].[AnswerOption] ([answerOptionId], [text], [isCorrectId], [questionId]) VALUES (7, N'Возникнет ошибка', 2, 9)
INSERT [dbo].[AnswerOption] ([answerOptionId], [text], [isCorrectId], [questionId]) VALUES (8, N'Вывод будет "Hello, World!"', 1, 9)
INSERT [dbo].[AnswerOption] ([answerOptionId], [text], [isCorrectId], [questionId]) VALUES (9, N'Добавить больше внешних ключей', 2, 2)
INSERT [dbo].[AnswerOption] ([answerOptionId], [text], [isCorrectId], [questionId]) VALUES (10, N'Ключи, индексы и представления', 2, 6)
INSERT [dbo].[AnswerOption] ([answerOptionId], [text], [isCorrectId], [questionId]) VALUES (11, N'Массив или список', 1, 4)
INSERT [dbo].[AnswerOption] ([answerOptionId], [text], [isCorrectId], [questionId]) VALUES (12, N'Недообучение происходит, когда модель хорошо работает как на тренировочных, так и на тестовых данных.', 2, 8)
INSERT [dbo].[AnswerOption] ([answerOptionId], [text], [isCorrectId], [questionId]) VALUES (13, N'Оба используют размеченные данные, но различаются способом их обработки.', 2, 1)
INSERT [dbo].[AnswerOption] ([answerOptionId], [text], [isCorrectId], [questionId]) VALUES (14, N'Обучение с учителем использует размеченные данные, а обучение без учителя использует неразмеченные данные.', 1, 1)
INSERT [dbo].[AnswerOption] ([answerOptionId], [text], [isCorrectId], [questionId]) VALUES (15, N'Переобучение происходит, когда модель хорошо работает на тренировочных данных, но плохо на новых данных.', 1, 8)
INSERT [dbo].[AnswerOption] ([answerOptionId], [text], [isCorrectId], [questionId]) VALUES (16, N'Связанный список', 2, 4)
INSERT [dbo].[AnswerOption] ([answerOptionId], [text], [isCorrectId], [questionId]) VALUES (17, N'Таблицы, столбцы и строки', 1, 6)
INSERT [dbo].[AnswerOption] ([answerOptionId], [text], [isCorrectId], [questionId]) VALUES (18, N'Удалить транзитивные зависимости', 1, 2)
INSERT [dbo].[AnswerOption] ([answerOptionId], [text], [isCorrectId], [questionId]) VALUES (19, N'Функция close()', 2, 5)
INSERT [dbo].[AnswerOption] ([answerOptionId], [text], [isCorrectId], [questionId]) VALUES (20, N'Функция open()', 1, 5)
SET IDENTITY_INSERT [dbo].[AnswerOption] OFF
GO
SET IDENTITY_INSERT [dbo].[Attendance] ON 

INSERT [dbo].[Attendance] ([attendanceId], [studentId], [lessonId], [is_present]) VALUES (1, 3, 3, N'Присутствие')
INSERT [dbo].[Attendance] ([attendanceId], [studentId], [lessonId], [is_present]) VALUES (2, 3, 8, N'Прогул')
INSERT [dbo].[Attendance] ([attendanceId], [studentId], [lessonId], [is_present]) VALUES (3, 4, 3, N'Присутствие')
INSERT [dbo].[Attendance] ([attendanceId], [studentId], [lessonId], [is_present]) VALUES (4, 4, 8, N'Присутствие')
INSERT [dbo].[Attendance] ([attendanceId], [studentId], [lessonId], [is_present]) VALUES (5, 1, 5, N'Присутствие')
INSERT [dbo].[Attendance] ([attendanceId], [studentId], [lessonId], [is_present]) VALUES (6, 1, 6, N'Прогул')
INSERT [dbo].[Attendance] ([attendanceId], [studentId], [lessonId], [is_present]) VALUES (7, 5, 7, N'Присутствие')
INSERT [dbo].[Attendance] ([attendanceId], [studentId], [lessonId], [is_present]) VALUES (8, 5, 10, N'Присутствие')
INSERT [dbo].[Attendance] ([attendanceId], [studentId], [lessonId], [is_present]) VALUES (9, 2, 2, N'Присутствие')
INSERT [dbo].[Attendance] ([attendanceId], [studentId], [lessonId], [is_present]) VALUES (10, 2, 1, N'Прогул')
INSERT [dbo].[Attendance] ([attendanceId], [studentId], [lessonId], [is_present]) VALUES (11, 4, 4, N'Прогул')
SET IDENTITY_INSERT [dbo].[Attendance] OFF
GO
INSERT [dbo].[CorrectAnswer] ([IDCorrect], [IsCorrect]) VALUES (1, N'Да')
INSERT [dbo].[CorrectAnswer] ([IDCorrect], [IsCorrect]) VALUES (2, N'Нет')
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([courseId], [name], [description], [startDate], [endDate], [teacherId]) VALUES (1, N'Web-разработка', N'Создание веб-приложений с использованием HTML, CSS и JavaScript', CAST(N'2023-11-01' AS Date), CAST(N'2024-03-31' AS Date), 10)
INSERT [dbo].[Course] ([courseId], [name], [description], [startDate], [endDate], [teacherId]) VALUES (2, N'Алгоритмы и структуры данных', N'Основные алгоритмы и структуры данных', CAST(N'2023-10-01' AS Date), CAST(N'2024-02-28' AS Date), 8)
INSERT [dbo].[Course] ([courseId], [name], [description], [startDate], [endDate], [teacherId]) VALUES (3, N'Базы данных', N'Теория и практика проектирования баз данных', CAST(N'2023-09-05' AS Date), CAST(N'2023-12-25' AS Date), 6)
INSERT [dbo].[Course] ([courseId], [name], [description], [startDate], [endDate], [teacherId]) VALUES (4, N'Машинное обучение', N'Введение в машинное обучение и искусственный интеллект', CAST(N'2023-12-01' AS Date), CAST(N'2024-04-30' AS Date), 7)
INSERT [dbo].[Course] ([courseId], [name], [description], [startDate], [endDate], [teacherId]) VALUES (5, N'Программирование на Python', N'Основы программирования на языке Python', CAST(N'2023-09-01' AS Date), CAST(N'2023-12-15' AS Date), 9)
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Lesson] ON 

INSERT [dbo].[Lesson] ([lessonId], [date], [time], [topicId], [duration], [courseId]) VALUES (1, CAST(N'2023-09-06' AS Date), CAST(N'09:00:00' AS Time), 3, CAST(N'01:30:10' AS Time), 5)
INSERT [dbo].[Lesson] ([lessonId], [date], [time], [topicId], [duration], [courseId]) VALUES (2, CAST(N'2023-09-13' AS Date), CAST(N'09:00:00' AS Time), 8, CAST(N'01:30:00' AS Time), 5)
INSERT [dbo].[Lesson] ([lessonId], [date], [time], [topicId], [duration], [courseId]) VALUES (3, CAST(N'2023-09-08' AS Date), CAST(N'14:00:00' AS Time), 5, CAST(N'02:00:00' AS Time), 3)
INSERT [dbo].[Lesson] ([lessonId], [date], [time], [topicId], [duration], [courseId]) VALUES (4, CAST(N'2023-09-15' AS Date), CAST(N'14:00:00' AS Time), 6, CAST(N'02:00:00' AS Time), 3)
INSERT [dbo].[Lesson] ([lessonId], [date], [time], [topicId], [duration], [courseId]) VALUES (5, CAST(N'2023-10-03' AS Date), CAST(N'10:00:00' AS Time), 7, CAST(N'01:45:00' AS Time), 2)
INSERT [dbo].[Lesson] ([lessonId], [date], [time], [topicId], [duration], [courseId]) VALUES (6, CAST(N'2023-10-10' AS Date), CAST(N'10:00:00' AS Time), 10, CAST(N'01:45:00' AS Time), 2)
INSERT [dbo].[Lesson] ([lessonId], [date], [time], [topicId], [duration], [courseId]) VALUES (7, CAST(N'2023-11-07' AS Date), CAST(N'11:00:00' AS Time), 2, CAST(N'02:00:00' AS Time), 1)
INSERT [dbo].[Lesson] ([lessonId], [date], [time], [topicId], [duration], [courseId]) VALUES (8, CAST(N'2023-11-14' AS Date), CAST(N'11:00:00' AS Time), 1, CAST(N'02:00:00' AS Time), 1)
INSERT [dbo].[Lesson] ([lessonId], [date], [time], [topicId], [duration], [courseId]) VALUES (9, CAST(N'2023-12-05' AS Date), CAST(N'12:00:00' AS Time), 4, CAST(N'01:30:00' AS Time), 4)
INSERT [dbo].[Lesson] ([lessonId], [date], [time], [topicId], [duration], [courseId]) VALUES (10, CAST(N'2023-12-12' AS Date), CAST(N'12:00:00' AS Time), 9, CAST(N'01:30:00' AS Time), 4)
SET IDENTITY_INSERT [dbo].[Lesson] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([questionId], [text], [type], [testId]) VALUES (1, N'В чем разница между обучением с учителем и без учителя?', N'Открытый ответ', 2)
INSERT [dbo].[Question] ([questionId], [text], [type], [testId]) VALUES (2, N'Как нормализовать базу данных до третьей нормальной формы (3NF)?', N'Открытый ответ', 5)
INSERT [dbo].[Question] ([questionId], [text], [type], [testId]) VALUES (3, N'Как центрировать элемент горизонтально с помощью CSS?', N'Один правильный ответ', 9)
INSERT [dbo].[Question] ([questionId], [text], [type], [testId]) VALUES (4, N'Какая структура данных наиболее подходит для реализации очереди?', N'Несколько правильных ответов', 10)
INSERT [dbo].[Question] ([questionId], [text], [type], [testId]) VALUES (5, N'Какая функция используется для чтения файла в Python?', N'Один правильный ответ', 7)
INSERT [dbo].[Question] ([questionId], [text], [type], [testId]) VALUES (6, N'Какие три основных компонента реляционной модели базы данных?', N'Несколько правильных ответов', 10)
INSERT [dbo].[Question] ([questionId], [text], [type], [testId]) VALUES (7, N'Какова временная сложность алгоритма бинарного поиска?', N'Один правильный ответ', 1)
INSERT [dbo].[Question] ([questionId], [text], [type], [testId]) VALUES (8, N'Объясните концепцию переобучения в машинном обучении.', N'Открытый ответ', 4)
INSERT [dbo].[Question] ([questionId], [text], [type], [testId]) VALUES (9, N'Что выводит команда print("Hello, World!") в Python?', N'Один правильный ответ', 7)
INSERT [dbo].[Question] ([questionId], [text], [type], [testId]) VALUES (10, N'Что содержит тег <head> в HTML?', N'Один правильный ответ', 6)
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([IDRole], [Role]) VALUES (1, N'Администратор')
INSERT [dbo].[Roles] ([IDRole], [Role]) VALUES (2, N'Преподаватель')
INSERT [dbo].[Roles] ([IDRole], [Role]) VALUES (3, N'Студент')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentAnswer] ON 

INSERT [dbo].[StudentAnswer] ([answerId], [resultId], [questionId], [answerOptionId]) VALUES (1, 7, 1, 2)
INSERT [dbo].[StudentAnswer] ([answerId], [resultId], [questionId], [answerOptionId]) VALUES (2, 8, 2, 1)
INSERT [dbo].[StudentAnswer] ([answerId], [resultId], [questionId], [answerOptionId]) VALUES (3, 7, 3, 2)
INSERT [dbo].[StudentAnswer] ([answerId], [resultId], [questionId], [answerOptionId]) VALUES (4, 8, 4, 1)
INSERT [dbo].[StudentAnswer] ([answerId], [resultId], [questionId], [answerOptionId]) VALUES (5, 3, 5, 1)
INSERT [dbo].[StudentAnswer] ([answerId], [resultId], [questionId], [answerOptionId]) VALUES (6, 5, 6, 2)
INSERT [dbo].[StudentAnswer] ([answerId], [resultId], [questionId], [answerOptionId]) VALUES (7, 1, 7, 2)
INSERT [dbo].[StudentAnswer] ([answerId], [resultId], [questionId], [answerOptionId]) VALUES (8, 10, 8, 1)
INSERT [dbo].[StudentAnswer] ([answerId], [resultId], [questionId], [answerOptionId]) VALUES (9, 6, 9, 2)
INSERT [dbo].[StudentAnswer] ([answerId], [resultId], [questionId], [answerOptionId]) VALUES (10, 9, 10, 2)
SET IDENTITY_INSERT [dbo].[StudentAnswer] OFF
GO
SET IDENTITY_INSERT [dbo].[Test] ON 

INSERT [dbo].[Test] ([testId], [titleId], [description], [maxScore], [time_limit], [courseId]) VALUES (1, 7, N'Основные концепции программирования на Python', 100, CAST(N'00:30:00' AS Time), 5)
INSERT [dbo].[Test] ([testId], [titleId], [description], [maxScore], [time_limit], [courseId]) VALUES (2, 1, N'Анализ сложности алгоритмов', 90, CAST(N'00:45:00' AS Time), 5)
INSERT [dbo].[Test] ([testId], [titleId], [description], [maxScore], [time_limit], [courseId]) VALUES (3, 2, N'Методы классификации в машинном обучении', 140, CAST(N'01:00:00' AS Time), 3)
INSERT [dbo].[Test] ([testId], [titleId], [description], [maxScore], [time_limit], [courseId]) VALUES (4, 3, N'Понимание моделей баз данных', 80, CAST(N'00:40:00' AS Time), 3)
INSERT [dbo].[Test] ([testId], [titleId], [description], [maxScore], [time_limit], [courseId]) VALUES (5, 4, N'Построение моделей регрессии', 160, CAST(N'01:45:00' AS Time), 2)
INSERT [dbo].[Test] ([testId], [titleId], [description], [maxScore], [time_limit], [courseId]) VALUES (6, 5, N'Применение нормализации к базам данных', 120, CAST(N'01:20:00' AS Time), 2)
INSERT [dbo].[Test] ([testId], [titleId], [description], [maxScore], [time_limit], [courseId]) VALUES (7, 6, N'Создание базовых веб-страниц с использованием HTML', 70, CAST(N'00:35:00' AS Time), 1)
INSERT [dbo].[Test] ([testId], [titleId], [description], [maxScore], [time_limit], [courseId]) VALUES (8, 8, N'Работа с файлами в Python', 150, CAST(N'01:00:00' AS Time), 1)
INSERT [dbo].[Test] ([testId], [titleId], [description], [maxScore], [time_limit], [courseId]) VALUES (9, 9, N'Стилизация веб-страниц с использованием CSS', 130, CAST(N'01:30:00' AS Time), 4)
INSERT [dbo].[Test] ([testId], [titleId], [description], [maxScore], [time_limit], [courseId]) VALUES (10, 10, N'Реализация общих структур данных', 110, CAST(N'01:15:00' AS Time), 4)
SET IDENTITY_INSERT [dbo].[Test] OFF
GO
SET IDENTITY_INSERT [dbo].[TestResult] ON 

INSERT [dbo].[TestResult] ([result_id], [student_id], [test_id], [score], [datetime]) VALUES (1, 3, 7, 85, CAST(N'2024-12-29T22:42:25.293' AS DateTime))
INSERT [dbo].[TestResult] ([result_id], [student_id], [test_id], [score], [datetime]) VALUES (2, 3, 8, 75, CAST(N'2024-12-29T22:42:25.340' AS DateTime))
INSERT [dbo].[TestResult] ([result_id], [student_id], [test_id], [score], [datetime]) VALUES (3, 4, 7, 95, CAST(N'2024-12-29T22:42:25.370' AS DateTime))
INSERT [dbo].[TestResult] ([result_id], [student_id], [test_id], [score], [datetime]) VALUES (4, 4, 8, 92, CAST(N'2024-12-29T22:42:25.400' AS DateTime))
INSERT [dbo].[TestResult] ([result_id], [student_id], [test_id], [score], [datetime]) VALUES (5, 1, 3, 65, CAST(N'2024-12-29T22:42:25.430' AS DateTime))
INSERT [dbo].[TestResult] ([result_id], [student_id], [test_id], [score], [datetime]) VALUES (6, 1, 5, 78, CAST(N'2024-12-29T22:42:25.463' AS DateTime))
INSERT [dbo].[TestResult] ([result_id], [student_id], [test_id], [score], [datetime]) VALUES (7, 5, 1, 88, CAST(N'2024-12-29T22:42:25.493' AS DateTime))
INSERT [dbo].[TestResult] ([result_id], [student_id], [test_id], [score], [datetime]) VALUES (8, 5, 10, 93, CAST(N'2024-12-29T22:42:25.523' AS DateTime))
INSERT [dbo].[TestResult] ([result_id], [student_id], [test_id], [score], [datetime]) VALUES (9, 2, 6, 72, CAST(N'2024-12-29T22:42:25.557' AS DateTime))
INSERT [dbo].[TestResult] ([result_id], [student_id], [test_id], [score], [datetime]) VALUES (10, 2, 9, 55, CAST(N'2024-12-29T22:42:25.590' AS DateTime))
SET IDENTITY_INSERT [dbo].[TestResult] OFF
GO
SET IDENTITY_INSERT [dbo].[TitleTest] ON 

INSERT [dbo].[TitleTest] ([IDTitle], [title]) VALUES (1, N'Анализ алгоритмов')
INSERT [dbo].[TitleTest] ([IDTitle], [title]) VALUES (2, N'Методы классификации')
INSERT [dbo].[TitleTest] ([IDTitle], [title]) VALUES (3, N'Модели данных')
INSERT [dbo].[TitleTest] ([IDTitle], [title]) VALUES (4, N'Модели регрессии')
INSERT [dbo].[TitleTest] ([IDTitle], [title]) VALUES (5, N'Нормализация')
INSERT [dbo].[TitleTest] ([IDTitle], [title]) VALUES (6, N'Основы HTML')
INSERT [dbo].[TitleTest] ([IDTitle], [title]) VALUES (7, N'Основы Python')
INSERT [dbo].[TitleTest] ([IDTitle], [title]) VALUES (8, N'Работа с файлами')
INSERT [dbo].[TitleTest] ([IDTitle], [title]) VALUES (9, N'Стилизация с помощью CSS')
INSERT [dbo].[TitleTest] ([IDTitle], [title]) VALUES (10, N'Структуры данных')
SET IDENTITY_INSERT [dbo].[TitleTest] OFF
GO
SET IDENTITY_INSERT [dbo].[Topic] ON 

INSERT [dbo].[Topic] ([IDTopic], [Topic]) VALUES (1, N'CSS стилизация')
INSERT [dbo].[Topic] ([IDTopic], [Topic]) VALUES (2, N'HTML основы')
INSERT [dbo].[Topic] ([IDTopic], [Topic]) VALUES (3, N'Введение в Python')
INSERT [dbo].[Topic] ([IDTopic], [Topic]) VALUES (4, N'Классификация данных')
INSERT [dbo].[Topic] ([IDTopic], [Topic]) VALUES (5, N'Модели данных')
INSERT [dbo].[Topic] ([IDTopic], [Topic]) VALUES (6, N'Нормализация данных')
INSERT [dbo].[Topic] ([IDTopic], [Topic]) VALUES (7, N'Поисковые алгоритмы')
INSERT [dbo].[Topic] ([IDTopic], [Topic]) VALUES (8, N'Работа с файлами')
INSERT [dbo].[Topic] ([IDTopic], [Topic]) VALUES (9, N'Регрессия')
INSERT [dbo].[Topic] ([IDTopic], [Topic]) VALUES (10, N'Хеш-таблицы')
SET IDENTITY_INSERT [dbo].[Topic] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([studentId], [firstName], [lastName], [email], [password], [groupNumber], [courseYear], [Role]) VALUES (1, N'Алексей', N'Сидоров', N'sidorov@example.com', N'password789', 103, 3, 3)
INSERT [dbo].[Users] ([studentId], [firstName], [lastName], [email], [password], [groupNumber], [courseYear], [Role]) VALUES (2, N'Дмитрий', N'Кузнецов', N'kuznetsov@example.com', N'password345', 105, 1, 3)
INSERT [dbo].[Users] ([studentId], [firstName], [lastName], [email], [password], [groupNumber], [courseYear], [Role]) VALUES (3, N'Иван', N'Иванов', N'ivanov@example.com', N'password123', 101, 1, 3)
INSERT [dbo].[Users] ([studentId], [firstName], [lastName], [email], [password], [groupNumber], [courseYear], [Role]) VALUES (4, N'Марина', N'Петрова', N'petrova@example.com', N'password456', 102, 2, 3)
INSERT [dbo].[Users] ([studentId], [firstName], [lastName], [email], [password], [groupNumber], [courseYear], [Role]) VALUES (5, N'Ольга', N'Васильева', N'vasilyeva@example.com', N'password012', 104, 4, 3)
INSERT [dbo].[Users] ([studentId], [firstName], [lastName], [email], [password], [groupNumber], [courseYear], [Role]) VALUES (6, N'Андрей', N'Николаев', N'nikolaev@example.com', N'teacherpass3', NULL, NULL, 2)
INSERT [dbo].[Users] ([studentId], [firstName], [lastName], [email], [password], [groupNumber], [courseYear], [Role]) VALUES (7, N'Анна', N'Павлова', N'pavlova@example.com', N'teacherpass4', NULL, NULL, 2)
INSERT [dbo].[Users] ([studentId], [firstName], [lastName], [email], [password], [groupNumber], [courseYear], [Role]) VALUES (8, N'Елена', N'Смирнова', N'smirnova@example.com', N'teacherpass2', NULL, NULL, 2)
INSERT [dbo].[Users] ([studentId], [firstName], [lastName], [email], [password], [groupNumber], [courseYear], [Role]) VALUES (9, N'Михаил', N'Орлов', N'orlov@example.com', N'teacherpass5', NULL, NULL, 2)
INSERT [dbo].[Users] ([studentId], [firstName], [lastName], [email], [password], [groupNumber], [courseYear], [Role]) VALUES (10, N'Сергей', N'Петров', N'petrov@example.com', N'teacherpass1', NULL, NULL, 2)
INSERT [dbo].[Users] ([studentId], [firstName], [lastName], [email], [password], [groupNumber], [courseYear], [Role]) VALUES (11, N'Скалочкин', N'Фёдор', N'fedorlohkin@gmail.com', N'fedorSuper123', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[TestResult] ADD  CONSTRAINT [DF__TestResul__datet__29221CFB]  DEFAULT (getdate()) FOR [datetime]
GO
ALTER TABLE [dbo].[AnswerOption]  WITH CHECK ADD  CONSTRAINT [FK_AnswerOption_CorrectAnswer] FOREIGN KEY([isCorrectId])
REFERENCES [dbo].[CorrectAnswer] ([IDCorrect])
GO
ALTER TABLE [dbo].[AnswerOption] CHECK CONSTRAINT [FK_AnswerOption_CorrectAnswer]
GO
ALTER TABLE [dbo].[AnswerOption]  WITH CHECK ADD  CONSTRAINT [FK_AnswerOption_Question] FOREIGN KEY([questionId])
REFERENCES [dbo].[Question] ([questionId])
GO
ALTER TABLE [dbo].[AnswerOption] CHECK CONSTRAINT [FK_AnswerOption_Question]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Lesson] FOREIGN KEY([lessonId])
REFERENCES [dbo].[Lesson] ([lessonId])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Lesson]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Users] FOREIGN KEY([teacherId])
REFERENCES [dbo].[Users] ([studentId])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Users]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Course] FOREIGN KEY([courseId])
REFERENCES [dbo].[Course] ([courseId])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_Course]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Topic] FOREIGN KEY([topicId])
REFERENCES [dbo].[Topic] ([IDTopic])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_Topic]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Test] FOREIGN KEY([testId])
REFERENCES [dbo].[Test] ([testId])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Test]
GO
ALTER TABLE [dbo].[StudentAnswer]  WITH CHECK ADD  CONSTRAINT [FK_StudentAnswer_AnswerOption] FOREIGN KEY([answerOptionId])
REFERENCES [dbo].[AnswerOption] ([answerOptionId])
GO
ALTER TABLE [dbo].[StudentAnswer] CHECK CONSTRAINT [FK_StudentAnswer_AnswerOption]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [FK_Test_Course] FOREIGN KEY([courseId])
REFERENCES [dbo].[Course] ([courseId])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [FK_Test_Course]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [FK_Test_TitleTest] FOREIGN KEY([titleId])
REFERENCES [dbo].[TitleTest] ([IDTitle])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [FK_Test_TitleTest]
GO
ALTER TABLE [dbo].[TestResult]  WITH CHECK ADD  CONSTRAINT [FK_TestResult_Test] FOREIGN KEY([test_id])
REFERENCES [dbo].[Test] ([testId])
GO
ALTER TABLE [dbo].[TestResult] CHECK CONSTRAINT [FK_TestResult_Test]
GO
ALTER TABLE [dbo].[TestResult]  WITH CHECK ADD  CONSTRAINT [FK_TestResult_Users] FOREIGN KEY([student_id])
REFERENCES [dbo].[Users] ([studentId])
GO
ALTER TABLE [dbo].[TestResult] CHECK CONSTRAINT [FK_TestResult_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([Role])
REFERENCES [dbo].[Roles] ([IDRole])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [DyplomWork] SET  READ_WRITE 
GO
