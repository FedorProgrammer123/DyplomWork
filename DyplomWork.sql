USE [master]
GO
/****** Object:  Database [DyplomWork]    Script Date: 02.06.2025 12:58:01 ******/
CREATE DATABASE [DyplomWork]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DyplomWork', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DyplomWork.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DyplomWork_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DyplomWork_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [DyplomWork] SET AUTO_CLOSE ON 
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
ALTER DATABASE [DyplomWork] SET  ENABLE_BROKER 
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
/****** Object:  Table [dbo].[AnswerOption]    Script Date: 02.06.2025 12:58:01 ******/
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
/****** Object:  Table [dbo].[Attendance]    Script Date: 02.06.2025 12:58:01 ******/
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
/****** Object:  Table [dbo].[CorrectAnswer]    Script Date: 02.06.2025 12:58:01 ******/
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
/****** Object:  Table [dbo].[Course]    Script Date: 02.06.2025 12:58:01 ******/
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
/****** Object:  Table [dbo].[Lesson]    Script Date: 02.06.2025 12:58:01 ******/
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
/****** Object:  Table [dbo].[Question]    Script Date: 02.06.2025 12:58:01 ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 02.06.2025 12:58:01 ******/
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
/****** Object:  Table [dbo].[StudentAnswer]    Script Date: 02.06.2025 12:58:01 ******/
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
/****** Object:  Table [dbo].[Test]    Script Date: 02.06.2025 12:58:01 ******/
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
	[Href] [text] NULL,
	[Mark] [nchar](10) NULL,
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[testId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestReport]    Script Date: 02.06.2025 12:58:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestReport](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Female] [nvarchar](250) NOT NULL,
	[TitleTestID] [int] NOT NULL,
	[TestScreen] [image] NOT NULL,
 CONSTRAINT [PK_TestReport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestResult]    Script Date: 02.06.2025 12:58:01 ******/
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
/****** Object:  Table [dbo].[TitleTest]    Script Date: 02.06.2025 12:58:01 ******/
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
/****** Object:  Table [dbo].[Topic]    Script Date: 02.06.2025 12:58:01 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 02.06.2025 12:58:01 ******/
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

INSERT [dbo].[Test] ([testId], [titleId], [description], [maxScore], [time_limit], [courseId], [Href], [Mark]) VALUES (1, 7, N'Основные концепции программирования на Python', 100, CAST(N'00:30:00' AS Time), 5, NULL, NULL)
INSERT [dbo].[Test] ([testId], [titleId], [description], [maxScore], [time_limit], [courseId], [Href], [Mark]) VALUES (2, 1, N'Анализ сложности алгоритмов', 90, CAST(N'00:45:00' AS Time), 5, NULL, NULL)
INSERT [dbo].[Test] ([testId], [titleId], [description], [maxScore], [time_limit], [courseId], [Href], [Mark]) VALUES (3, 2, N'Методы классификации в машинном обучении', 140, CAST(N'01:00:00' AS Time), 3, NULL, NULL)
INSERT [dbo].[Test] ([testId], [titleId], [description], [maxScore], [time_limit], [courseId], [Href], [Mark]) VALUES (4, 3, N'Понимание моделей баз данных', 80, CAST(N'00:40:00' AS Time), 3, NULL, NULL)
INSERT [dbo].[Test] ([testId], [titleId], [description], [maxScore], [time_limit], [courseId], [Href], [Mark]) VALUES (5, 4, N'Построение моделей регрессии', 160, CAST(N'01:45:00' AS Time), 2, NULL, NULL)
INSERT [dbo].[Test] ([testId], [titleId], [description], [maxScore], [time_limit], [courseId], [Href], [Mark]) VALUES (6, 5, N'Применение нормализации к базам данных', 120, CAST(N'01:20:00' AS Time), 2, NULL, NULL)
INSERT [dbo].[Test] ([testId], [titleId], [description], [maxScore], [time_limit], [courseId], [Href], [Mark]) VALUES (7, 6, N'Создание базовых веб-страниц с использованием HTML', 70, CAST(N'00:35:00' AS Time), 1, NULL, NULL)
INSERT [dbo].[Test] ([testId], [titleId], [description], [maxScore], [time_limit], [courseId], [Href], [Mark]) VALUES (8, 8, N'Работа с файлами в Python', 150, CAST(N'01:00:00' AS Time), 1, NULL, NULL)
INSERT [dbo].[Test] ([testId], [titleId], [description], [maxScore], [time_limit], [courseId], [Href], [Mark]) VALUES (9, 9, N'Стилизация веб-страниц с использованием CSS', 130, CAST(N'01:30:00' AS Time), 4, NULL, NULL)
INSERT [dbo].[Test] ([testId], [titleId], [description], [maxScore], [time_limit], [courseId], [Href], [Mark]) VALUES (10, 10, N'Реализация общих структур данных', 110, CAST(N'01:15:00' AS Time), 4, NULL, NULL)
INSERT [dbo].[Test] ([testId], [titleId], [description], [maxScore], [time_limit], [courseId], [Href], [Mark]) VALUES (11, 11, N'Пройдите и получите 5', 12, CAST(N'00:39:00' AS Time), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Test] OFF
GO
SET IDENTITY_INSERT [dbo].[TestReport] ON 

INSERT [dbo].[TestReport] ([ID], [Name], [Female], [TitleTestID], [TestScreen]) VALUES (1, N'Иван', N'Иванов', 11, 0xFFD8FFE000104A46494600010100000100010000FFDB008400090607120F10100F0F0F0F0F100F0F10150F0F0F0F100F0F0F101515161615151515181D2820181A251D151521312125292B2E2E2E171F3338332D37282D2E2B010A0A0A0E0D0E17100F152B19151D2D2B2D2B2B2D2D2D2D2B2D2B2D2D2D2D2D2D2D2D2B2B2D2D2D2B2B2D2D2D2D2B2B2B2B372D2D2B372D2B2B2B2B2B2D2B372DFFC000110800A2013803012200021101031101FFC4001B00000203010101000000000000000000000204000103050607FFC4003610000201020404030704020105000000000001020311041221310513415161718106227291A1B1C13252D1E123F06214334253F1FFC400190101010101010100000000000000000000000102030405FFC4002111010101010101000104030000000000000001021131214103123261224251FFDA000C03010002110311003F007906814123ECD7C612090290488944838808388048340A0E241772E2448B41068348041A0A241A050480341205068809048141105A2DCD2576D24BABD11C9E31C6A387F755A551F4E91F33C863B8B4EABBCE6DF65D17921C6A47B9A9C668477AA9FC29CBEC5D0E31427A2A897C49C7EACF9CF3C285765E2FED7D4E367AA69AEEB545D8F03C278CCE8BD1DE3D62DE8FF83DBE0F14AAC14E3B3E9D53EC4B138DCA65B29994030584C1654A160B0C16500C10982CA0580C360B2810584CA9000C00D9560336596D102394182822D6848205041048340234405A0D008344161A4020D041A0D008D1055A0A20A0E280241A05048824DB49B4AEFB5ED739D8EE330853934ED5168A1256927E28E99E3BDB2C42751455BDC86BDEEF5FE08B276B858CC439B6DB6DB7AB117268B72339DC3BC8D9D40B38BC3C7F90F35BB7C821EA533D4FB258EB4DD36F49AD3E2478EA32BF53A9C3710E138C96F169FC9959B1F4B65034A6A51525B4926BC9A08C398582C2902CA942C1081280902CD180CA0580C3900CB00B2996CA600B2D2282480B54990DD1083CEC4206212355448340A0904120D0110C0241A06211116830106810710C18841448340209300D06804556AAA11737B455D90562F0CAAC72C9C92FF8C9C5FF0067CD78A4BDF92BB6949A4DBBBB2D15CF4F8AF6A9DA4A34D2D1A4DC9DD78EC78CC4D4BB6C95D312F58D59A49DCC218A6ACB7B780159B64A52B45DE37F1D0C7E5DFC9E74F427171CCA4BCBAA079EAFDEC72F2DDF619A10BDD76487EE4B97569D44F619C354D4E3D0567ADFD0E9611EA6E562C7D3B82CEF87A5F0DBE5A0E9CEF67DDF0F4FD7EECE892B88582C3603050821329950120586C06502C16130596006504C120A09021D35A94166976207221079F88510130E269468240A090414422904802411510888B41A050480B61A0186905120920106981A231E214B3D2A915BB8BB1B442641F2EC63D442AABC6FD4EDFB4B83E4D5947A3778F933852A9BAEC66BD1963CB6F70A1435BCB646917731C44F33C8BD5FE0CBA759E2F131578C755FBBABF2F0270DA9793F4255C2A93B269593D5B497D4C70F1719349AF133F57E71D493F7BCFA7E4730BA33969EB76EECE9609DD9D239E9F4BF66D5B0F0F1727F53A629C2236A14BE088D8AF3A982C3603050B01B0D80D1514030C06502C16130596016532CA64141C55C035A7FEEB6024935D7EE512A321479C4CDE0CC606B02AB541240A0D041A2D148B401A08A896888241A050482AD848161A405A0800EE01C41C462234E2E536A29757F839DC4F8BC682B2B4A7D237DBCCF1BC57894EABBCE4DF65D17825D095A99EB3F687883AF3726F4BBCABF6C7B1C072566CDF1956F65DAE2A9E8D1CED7A333E35854B2F101D4CBE2DF4EA48AF74E7F3ECF5DAFA4BB3D0C5AEB3266D29CE2D46FAF5F0375257BE56B57E5A18D2C55B66B4BF5D2E1BAB7DDAB2EDD474B1ADF53A9807AA38D19DDDFEE7530D575BEDB6C6F35CF53E3EB5C2636A1493FFD71FB0D9C3F6571EAA5254DB59A9E895F571E8CEDDCD3CCB6030982C20582C260B2A0240C8260C8A058213280065309825111AC569FFC01346AAB2FDA8831A8881D59A7B2488079FA68382069EE6B146944838A01071082410212440712D149051082412050680B916995201CACAFD82B56CE1716E3CA1785269BEB3E8BCBB88F19E32E77A74DDA1D65D67FD1E76B5425ADCC98A959C9B6DB6DBD5B39F88A979A5E05CA4EC29567695FFDD8E7AAEB98CABBF7BC1E6B7CCC14ED634AFF00A60FE3FBDFF26728EC65D2367356B3EA219A29D9EB1BFA8C54A892E9A08AB49EBB2FA99B5D722AD28DFDDBDBBDACCDE9D586C93F5B0C4B0746318372D656BB52D9BDF32DD034F0B157B6BAE8FBAE83959FDD1716AEADA5C7B0B3D7D19CEAAD6CBB8E60356FC22FF83518D78F41C3B1B2A72528BB38ECCF71C1F8B2C459369545BAD93F147CD684FDEF467430B89719269D9A7A35D0EB1C3597D4EEC1CC70382F1AE75A1295A7F49F9788E62AB494AD77A2E9A0E393A4D82CCE9D54D2D53F50D8E0CA352ED84CCD245F9328B650326FB9127D4A230026CA605305B09985795969DC036C80A6403971DCD519ADCD114A241C41412008388214480D16812D041A0D19E62F3856B2D8E0FB458EC91E5C5FBD3FD5E11FECEC4AA1E0F89E25D4A939776FE5D095ACCED2D5262D5A5A072998CF6B18AEB0109B7A0B6235767DDFF033466A3A3DC525AFBDFF0025F5D4C574CAF11FA6292FD2DBF38E9A14DA68D388E8A325A3BAFAE8C55A74E791EAB5B32458C71549DAE95FBA1294D5F4BF4D0EAC67AD8471542F55457546751D31455B111694575379D6B452BF432783518B7A3ECCC1C74BFC876ADE53147DE77E88EA6155937FB9A4BBB4B57F510C2C2FE4B593ECBB2F163F436CEFB5A2BB235972D35A52D463309E11DEFE4864DC73D7A770B897092927669A69F667BAE17C4162219F4CC9473AECD7E0F9ACE6CE9F07E22E9496AF2BD26BBC4DCAC6B3F1F436A0FA44A74574725E52673A09495E328BF2772394977F434E4625464DD94DBB7560BA1516CEFEBFC85869BEBB237CE00E194BFF002633262D982E601A90CB984E61068CC2BAD3D506EA19D49268A33A8E2AC9DB57A221CA4EF3DEDAEEDEC4071AE634A7232414645530825217CE5E709C3198BCE2D9CACE035CC2F38AE72B38386F9857305B3959C02C756B539BED097D8F0D296A7B0C62CF4E71EF176F3E8788FF00A957B4B47F431A74C45CA4452B83369EDA8149EA63AE9C054A7965293EAAD15E65460B2F9B7FEFD0BE20B483EB7D3E46B463EEA5E08CFE5AEFC618B8B938C56A8CF1D04D41C93F7A2B55BA6B4FE07A8455DBEBA7D01AC9A49A57B49FC99384AE1CB345DAD9ADD56BF3EC02AAF34AEADB2F147767520D5A70E8F5CADFD508CA953BB929DEDFB93BB5DB52DCFF006DCDFF00447115DB4A2B65EA053A72934ACF567525923B2776ACECDBD357FD19D09669351DBAF5F43362CD35A3474515AABEAFF73EFE433896A31697446F4E95ACFB08E39DFE68D738E7DED6B815EEB7DE5F646D266383D20BC6FF0070A4CD4F12FAB6CB8C8C5CCA521D5E3D070DC4370DFF004B68E952C6CF6526FC1EA73BD96ABAD483D5349D9F7D9FE0F411A514EEA293EE8EB3C71D7A6F0F51B49CAD77BD8D7982AA65E70E66B984E60AF309CC01BE6159C57984E600D673394EE639C99CA32C2E9393B69AAFA90C6B3B5D2BDDBBE9DBC48153984E60B7309CC0BC33CC2F38AF309CC1D386B39338AF3099C1C359C99C57393980E1ACE56716E613980E3794F43C0E2F76D3D2FA69D0F5DC4313929CE5E0D2F37A23C84DDCE5BAEBFA7129AF7746D7F231496C63496C9FA9B73229A4DA4DEC61BACF152BCA31FF007563BA58477AFF000AFC7F633376D044D4F2252D029BF7276DD6BE8670576691DEDD269A148E54EA26AE9B5AEEBCC09D4CCF593DB7319472B69F4935F2261E8B79B4DBD6C63AEFC8D31955C62ACDBBEEC678452B2CDDC5AAC1B6A2FBEBE47470E59F6B1ABFE3C392968218D764BC5DFE4BFB1CCC73B893BCA2BC34F57637AF1CF1E99A37CB1BAB592D0951DCB72E804E56F322B39351DF52B9A96A63535338C7522C8F45ECD55BD57DB24BEE8F52A6793F667F5CDF68A5F37FD1E8D543B63C71DFA6B3979C57393986D8E19E613982EAA13980339CACE2FCC27300679854AA0BF30173B838D6F7F2EBE2432CE422B0CE4CE2F98998298CE4CE2F72F301BE726717B93300CE72B38BE6266018E613982F98970399ED0625DE34FA5B33F3D91C58D4E837C6AA5EABF0515E5D7F22394E1ABF5DF33E1CA4238CB4DDEF649D93F05FD9A4EB64875BBD177BB10AF36BDD5B595CCDAD621FE1955466E327AB5EEBE9E4746A23CCE6BEBD7B9D9E198CE62C92FD4BEA866A6F3F93B4DEA692E8FB340C606ACDF3E39F5C9E2141AA8DAD549665DAFD4DB051F76F6EAEE315D5ECB705C72C5F4D3E8638DFEEECE39952A7F97C07E125D0430B1E64E52E83EA8DB62C5D7FC3117A1CCC73BD58AECE1F736AB8E843AE67DA3A884F17195553D95D6FB8D5F898CD8EBCDA5E660D5CB8D552D534C8D951954B25AD90B47109E9E3A789318B369E262A08C7E5B93E3D3FB35A2A8FC62BEE76F39E67D9BAD67387749DFC569F93BD98F462FC71DCFA67984E60BDC998D306339338BE6266037E617CC17B92E0339CACE619CACC0339CA17CC4000A2C845428B201442102210B2014CAB9080799E23FF007AA7C42D12C879EFAF4C056DE1F17E052BFEA979944335BCF8AA3BB34C0BFF002C3E2442195D795E9D04421E9AF2B07FAFD199633F4CBC884315A9F825C2369F9896326DD4926DB5D9B6D1087375FF006A5D83577210CD7435C27F54BE1FC9D39144379F1C77FC89E20CE5BFA1081B9E3ABECEBFF24BE0FCA3D090877FD3FE2E1BF564210D30A2D16408A65108042D108042C8403FFFD9)
SET IDENTITY_INSERT [dbo].[TestReport] OFF
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
INSERT [dbo].[TitleTest] ([IDTitle], [title]) VALUES (11, N'Тест по основам Cotlin')
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
INSERT [dbo].[Users] ([studentId], [firstName], [lastName], [email], [password], [groupNumber], [courseYear], [Role]) VALUES (12, N'Иванов', N'Иван', N'Ivanov@kait20.com', N'Cdewsxzaq232sd', 103, 2, 3)
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
ALTER TABLE [dbo].[TestReport]  WITH CHECK ADD  CONSTRAINT [FK_TestReport_TitleTest] FOREIGN KEY([TitleTestID])
REFERENCES [dbo].[TitleTest] ([IDTitle])
GO
ALTER TABLE [dbo].[TestReport] CHECK CONSTRAINT [FK_TestReport_TitleTest]
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
