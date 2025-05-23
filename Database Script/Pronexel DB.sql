USE [PRONEXEL_DB]
GO
/****** Object:  User [DbUser]    Script Date: 5/18/2025 7:28:03 PM ******/
CREATE USER [DbUser] FOR LOGIN [DbUser] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/18/2025 7:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 5/18/2025 7:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/18/2025 7:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/18/2025 7:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/18/2025 7:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/18/2025 7:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/18/2025 7:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[DisplayName] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[ContactInfo] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 5/18/2025 7:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChapterType]    Script Date: 5/18/2025 7:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChapterType](
	[ID] [varchar](100) NULL,
	[ChName] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Media]    Script Date: 5/18/2025 7:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Media](
	[MediaID] [varchar](100) NOT NULL,
	[SubTopicID] [varchar](100) NULL,
	[MediaType] [varchar](50) NULL,
	[MediaURL] [nvarchar](max) NULL,
	[Title] [nvarchar](255) NULL,
	[UploadedOn] [datetime] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MediaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 5/18/2025 7:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[ID] [varchar](100) NOT NULL,
	[CatId] [varchar](100) NULL,
	[QuestionMedia] [varchar](100) NULL,
	[Isdelete] [bit] NULL,
	[createdOn] [datetime] NULL,
	[Title] [varchar](max) NULL,
	[Qstatus] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizAnswer]    Script Date: 5/18/2025 7:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizAnswer](
	[AnswerID] [varchar](100) NOT NULL,
	[AnswerText] [varchar](max) NULL,
	[IsCorrect] [bit] NULL,
	[IsDelete] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[AnswerMedia] [varchar](100) NULL,
	[QuestionID] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[AnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Themecolor]    Script Date: 5/18/2025 7:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Themecolor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ThemeColor] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TopicCategory]    Script Date: 5/18/2025 7:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopicCategory](
	[ID] [varchar](100) NOT NULL,
	[TopicName] [varchar](255) NOT NULL,
	[TopicDescription] [text] NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
	[UpdatedOn] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[Status] [varchar](50) NULL,
	[CategoryType] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TopicSubCategory]    Script Date: 5/18/2025 7:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopicSubCategory](
	[SubTopicID] [varchar](100) NOT NULL,
	[CatID] [varchar](100) NULL,
	[SubTopicName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[SubTopicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAnswers]    Script Date: 5/18/2025 7:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAnswers](
	[ID] [varchar](100) NOT NULL,
	[SelectdAnswerID] [varchar](100) NULL,
	[UserID] [varchar](100) NULL,
	[QuestionID] [varchar](100) NULL,
	[IsTrue] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserContentViewHistory]    Script Date: 5/18/2025 7:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserContentViewHistory](
	[ID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[MediaID] [uniqueidentifier] NOT NULL,
	[ViewedOn] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserQuiz]    Script Date: 5/18/2025 7:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserQuiz](
	[ID] [varchar](100) NOT NULL,
	[UserId] [varchar](100) NULL,
	[QID] [varchar](100) NULL,
	[AnswerID] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250417032951_rrrr', N'8.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250417033359_first', N'8.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250417033533_r1', N'8.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250511110105_ddd', N'8.0.0')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'008f32df-2372-40c1-8430-46ade8bdda49', N'ApplicationUser', N'APPLICATIONUSER', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'3577056d-c168-4e88-bccf-aa3927540091', N'SuperAdmin', N'SUPERADMIN', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'83da5fdf-85da-4d8d-952b-68d03b69c749', N'Admin', N'ADMIN', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c88f74b6-9c41-4f13-9c7e-ace65748a54e', N'008f32df-2372-40c1-8430-46ade8bdda49')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd353c464-7aba-4105-90cc-6d4a990f6745', N'008f32df-2372-40c1-8430-46ade8bdda49')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f2fc63dd-641b-4f90-85f2-69c9a1805494', N'008f32df-2372-40c1-8430-46ade8bdda49')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'20f56f48-de49-4d8a-8f33-bf961fcea84b', N'3577056d-c168-4e88-bccf-aa3927540091')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'497ae08c-53dd-4758-b04b-6f25d956c03c', N'83da5fdf-85da-4d8d-952b-68d03b69c749')
GO
INSERT [dbo].[AspNetUsers] ([Id], [DisplayName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [ContactInfo]) VALUES (N'20f56f48-de49-4d8a-8f33-bf961fcea84b', N'Mir Moheen Imtiaz', N'mirmoheen', N'MIRMOHEEN', N'mirmoheen9@gmail.com', N'MIRMOHEEN9@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAECcT8xIJiDdz1DZKiZNZ0S0DZZ8BLOKKG6gGCtibesZyOfKwiiAgpiWinqFkODtQQg==', N'E23MQL3TASACNHXFSGOWKJ2QQIJZEQJG', N'7febc9ba-7ac2-4d1d-90f6-c7f355fef9f4', NULL, 0, 0, NULL, 1, 0, N'', N'')
GO
INSERT [dbo].[AspNetUsers] ([Id], [DisplayName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [ContactInfo]) VALUES (N'497ae08c-53dd-4758-b04b-6f25d956c03c', N'Nero Fry', N'jydekipy', N'JYDEKIPY', N'mafud@mailinator.com', N'MAFUD@MAILINATOR.COM', 0, N'AQAAAAIAAYagAAAAEBTTwNIvAG+m713nYqgyQDIQurM5hSWWHrfqCJvORqWO7x+04JoR0a/0lfYmj8Zq8w==', N'JY5WJTEFGILPFYBRVRBRVOTPMK76WYRI', N'4ac1d08d-6383-44c0-8e7b-cff0bf9f78fe', NULL, 0, 0, NULL, 1, 0, N'', N'')
GO
INSERT [dbo].[AspNetUsers] ([Id], [DisplayName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [ContactInfo]) VALUES (N'c88f74b6-9c41-4f13-9c7e-ace65748a54e', N'Admin User', N'AppUser', N'APPUSER', N'VEHENUQ@MAILINATOR.COM', N'VEHENUQ@MAILINATOR.COM', 0, N'AQAAAAIAAYagAAAAEFLf1Ajsq+fCUrNoyDugv2HL5J7m+joZLN1AlK4/MMtkBqHoBE3Z7A5qAP3pZ2jOGQ==', N'VZYUWZZFXLJS3X642MUKVQ76HRXT3DCY', N'89f8cae0-6659-4900-aa0d-c027a9e577de', NULL, 0, 0, NULL, 1, 0, N'pakistan', N'03445324870')
GO
INSERT [dbo].[AspNetUsers] ([Id], [DisplayName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [ContactInfo]) VALUES (N'd353c464-7aba-4105-90cc-6d4a990f6745', N'Sigourney Porter', N'AppUser2', N'APPUSER2', N'mepipubes@mailinator.com', N'MEPIPUBES@MAILINATOR.COM', 0, N'AQAAAAIAAYagAAAAEDmyhjJPJLztPtuxqOnhq2ecLbw/XRjyCYsiTHzVaKhqS4DaJM+Y9tbbxpoz6Rf0YA==', N'3MDO7K46N2OQ5EY6HH7MQYMF726XL2LI', N'607a54e8-7d93-4a23-952a-aca9d82886f7', NULL, 0, 0, NULL, 1, 0, N'In vitae cumque repr', N'+1 (305) 124-9466')
GO
INSERT [dbo].[AspNetUsers] ([Id], [DisplayName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [ContactInfo]) VALUES (N'f2fc63dd-641b-4f90-85f2-69c9a1805494', N'Wyatt Flynn', N'AppUser3', N'APPUSER3', N'loramyzok@mailinator.com', N'LORAMYZOK@MAILINATOR.COM', 0, N'AQAAAAIAAYagAAAAEIBQGx/7NYS6B1ZKnVtZH9O2DVcr1t/arCq6tniReRsNpJLbxNDCHdd5eLkRHX9ulQ==', N'IZEKRGSFTYSYJLPXAAN5TN6L2LEH45QW', N'c6feabe7-223e-495a-9d4c-91a90c97b2e3', NULL, 0, 0, NULL, 1, 0, N'Est voluptas autem ', N'+1 (621) 283-7952')
GO
INSERT [dbo].[ChapterType] ([ID], [ChName]) VALUES (N'48DF2C1E-00EB-4D89-B006-DF8B8D82BBEF', N'Rigs')
GO
INSERT [dbo].[ChapterType] ([ID], [ChName]) VALUES (N'8F097248-CC53-4E20-B731-5DFA0F256E5A', N'CD2')
GO
INSERT [dbo].[Media] ([MediaID], [SubTopicID], [MediaType], [MediaURL], [Title], [UploadedOn], [IsDeleted]) VALUES (N'157C3258-65C2-42C5-936A-55B2C6D94010', N'B5A251B4-8442-4C49-A1FC-A270DF5005F1', N'Video', N'/Media/Video/b49839f4-347b-4563-b910-052add4b343b.mp4', N'New isnsert', CAST(N'2025-05-15T17:40:55.090' AS DateTime), 0)
GO
INSERT [dbo].[Media] ([MediaID], [SubTopicID], [MediaType], [MediaURL], [Title], [UploadedOn], [IsDeleted]) VALUES (N'84FEFE14-D34E-436B-AF5C-670491C0F031', N'E258D50B-1E0A-4C40-BC09-77CDADBDD303', N'Video', N'/Media/Video/dde436cf-98e3-43a3-b37f-bc5fbf569fce.mp4', N'New isnsert', CAST(N'2025-05-15T20:03:02.063' AS DateTime), 0)
GO
INSERT [dbo].[Quiz] ([ID], [CatId], [QuestionMedia], [Isdelete], [createdOn], [Title], [Qstatus]) VALUES (N'0FED3C8F-2085-495C-A41D-99E75AE1E1AE', N'6D292746-B966-435F-9DF5-DAD699657555', NULL, 0, CAST(N'2025-05-13T19:25:41.107' AS DateTime), N'What is the primary function of a Top Drive system?', N'Active')
GO
INSERT [dbo].[Quiz] ([ID], [CatId], [QuestionMedia], [Isdelete], [createdOn], [Title], [Qstatus]) VALUES (N'3FDEA121-72EA-45EF-A4FB-071974D16E39', N'6D292746-B966-435F-9DF5-DAD699657555', NULL, 0, CAST(N'2025-05-13T22:03:34.683' AS DateTime), N'What is the primary purpose of drilling mud in oil and gas drilling operations?', N'Active')
GO
INSERT [dbo].[Quiz] ([ID], [CatId], [QuestionMedia], [Isdelete], [createdOn], [Title], [Qstatus]) VALUES (N'C9EF78A8-EBE0-4C49-BA9A-8A0BF3C9B7A6', N'6D292746-B966-435F-9DF5-DAD699657555', NULL, 0, CAST(N'2025-05-14T17:51:38.827' AS DateTime), N'test question for demo', N'Active')
GO
INSERT [dbo].[QuizAnswer] ([AnswerID], [AnswerText], [IsCorrect], [IsDelete], [CreatedOn], [AnswerMedia], [QuestionID]) VALUES (N'5F6147FC-2E5D-42D1-898E-7FC61DCD7B91', N'Pump cement slurry', 0, 0, CAST(N'2025-05-13T19:34:09.440' AS DateTime), N'/Media/Answer/e2224449-1e0f-4ead-904e-eb3521ee76b3.jpeg', N'0FED3C8F-2085-495C-A41D-99E75AE1E1AE')
GO
INSERT [dbo].[QuizAnswer] ([AnswerID], [AnswerText], [IsCorrect], [IsDelete], [CreatedOn], [AnswerMedia], [QuestionID]) VALUES (N'6502D747-9538-45C7-AD33-91C1D74A0391', N'Support the drill string and rotate it', 1, 0, CAST(N'2025-05-13T19:33:28.547' AS DateTime), N'/Media/Answer/7b922365-085b-4cfe-8484-6cc07802f52d.jpg', N'0FED3C8F-2085-495C-A41D-99E75AE1E1AE')
GO
INSERT [dbo].[QuizAnswer] ([AnswerID], [AnswerText], [IsCorrect], [IsDelete], [CreatedOn], [AnswerMedia], [QuestionID]) VALUES (N'68838A63-A48A-436F-A8F1-019D22A4AD6F', N'To prevent corrosion of the rig', 0, 0, CAST(N'2025-05-13T22:05:26.160' AS DateTime), N'/Media/Answer/de526214-6ad4-481e-aac3-54424fa60506.jpeg', N'3FDEA121-72EA-45EF-A4FB-071974D16E39')
GO
INSERT [dbo].[QuizAnswer] ([AnswerID], [AnswerText], [IsCorrect], [IsDelete], [CreatedOn], [AnswerMedia], [QuestionID]) VALUES (N'790CAD34-AC4C-4926-955E-DECCA94F7021', N'test answer 1 ', 1, 0, CAST(N'2025-05-14T17:52:16.950' AS DateTime), N'/Media/Answer/b3d5728d-3da1-49a2-a4cb-c0660f1401cb.jpeg', N'C9EF78A8-EBE0-4C49-BA9A-8A0BF3C9B7A6')
GO
INSERT [dbo].[QuizAnswer] ([AnswerID], [AnswerText], [IsCorrect], [IsDelete], [CreatedOn], [AnswerMedia], [QuestionID]) VALUES (N'8B68D667-57F8-42CF-90C2-3B83EA01967B', N'To lubricate the drill bit and remove cuttings', 1, 0, CAST(N'2025-05-13T22:04:40.940' AS DateTime), N'/Media/Answer/a8369b65-b848-4a06-b44f-77da13fae59a.jpg', N'3FDEA121-72EA-45EF-A4FB-071974D16E39')
GO
INSERT [dbo].[QuizAnswer] ([AnswerID], [AnswerText], [IsCorrect], [IsDelete], [CreatedOn], [AnswerMedia], [QuestionID]) VALUES (N'8BB014AC-E2AF-42D8-A6E9-FCAC231F7EDA', N'To increase the pressure in the reservoir', 0, 0, CAST(N'2025-05-13T22:04:11.983' AS DateTime), N'/Media/Answer/13510a10-11e8-45b9-b268-71b5dc9fa666.jpeg', N'3FDEA121-72EA-45EF-A4FB-071974D16E39')
GO
INSERT [dbo].[QuizAnswer] ([AnswerID], [AnswerText], [IsCorrect], [IsDelete], [CreatedOn], [AnswerMedia], [QuestionID]) VALUES (N'C9EDA2E0-39A2-4D49-B0FF-FC469DD844F6', N'Prevent blowouts', 0, 0, CAST(N'2025-05-13T19:33:51.303' AS DateTime), N'/Media/Answer/a945d85a-49a3-467c-8616-03d886f63d73.jpeg', N'0FED3C8F-2085-495C-A41D-99E75AE1E1AE')
GO
INSERT [dbo].[QuizAnswer] ([AnswerID], [AnswerText], [IsCorrect], [IsDelete], [CreatedOn], [AnswerMedia], [QuestionID]) VALUES (N'D4A6C4DE-A73D-4EAA-905E-65A99D19A549', N'To cement the casing in place', 0, 0, CAST(N'2025-05-13T22:05:05.020' AS DateTime), N'/Media/Answer/9c61e468-d6fa-43bc-bf72-7e59c9aa88f8.jpeg', N'3FDEA121-72EA-45EF-A4FB-071974D16E39')
GO
INSERT [dbo].[QuizAnswer] ([AnswerID], [AnswerText], [IsCorrect], [IsDelete], [CreatedOn], [AnswerMedia], [QuestionID]) VALUES (N'FFB6F0F2-3073-410E-BD15-1DD68B85DF60', N'Use rotary table to rotate drill pipe', 0, 0, CAST(N'2025-05-13T19:33:03.810' AS DateTime), N'/Media/Answer/470e0c98-6ac7-4356-a4aa-b90560df3aec.jpeg', N'0FED3C8F-2085-495C-A41D-99E75AE1E1AE')
GO
SET IDENTITY_INSERT [dbo].[Themecolor] ON 
GO
INSERT [dbo].[Themecolor] ([ID], [ThemeColor]) VALUES (1, N'Normal')
GO
SET IDENTITY_INSERT [dbo].[Themecolor] OFF
GO
INSERT [dbo].[TopicCategory] ([ID], [TopicName], [TopicDescription], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [Status], [CategoryType]) VALUES (N'3DD92A2B-270D-495A-BA27-EEC8A8C555BA', N'Special Drill String Tools', N'Special drill string tools include stabilizers, reamers, jars, shock subs, and mud motors, used to enhance drilling efficiency and control.', N'20f56f48-de49-4d8a-8f33-bf961fcea84b', CAST(N'2025-05-04T13:08:15.673' AS DateTime), N'20f56f48-de49-4d8a-8f33-bf961fcea84b', NULL, 0, N'Active', N'Rigs')
GO
INSERT [dbo].[TopicCategory] ([ID], [TopicName], [TopicDescription], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [Status], [CategoryType]) VALUES (N'56F513ED-CD90-493A-A2CF-CD8D14B10C6F', N'Drills String Components', N'Drill string components include the drill bit, drill collars, heavy-weight drill pipe, and drill pipe.', N'20f56f48-de49-4d8a-8f33-bf961fcea84b', CAST(N'2025-05-04T13:06:54.377' AS DateTime), N'20f56f48-de49-4d8a-8f33-bf961fcea84b', NULL, 0, N'Active', N'Rigs')
GO
INSERT [dbo].[TopicCategory] ([ID], [TopicName], [TopicDescription], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [Status], [CategoryType]) VALUES (N'6D292746-B966-435F-9DF5-DAD699657555', N'Rig Types', N'Rig types in oil and gas include land rigs, jack-up rigs, semi-submersible rigs, drillships, and platform rigs.', N'20f56f48-de49-4d8a-8f33-bf961fcea84b', CAST(N'2025-05-04T13:03:17.347' AS DateTime), N'20f56f48-de49-4d8a-8f33-bf961fcea84b', NULL, 0, N'Active', N'Rigs')
GO
INSERT [dbo].[TopicCategory] ([ID], [TopicName], [TopicDescription], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [Status], [CategoryType]) VALUES (N'724710A8-3B21-4A9E-A260-8BAE5F297E19', N'New Added In Demo', N'Added for display demo', N'20f56f48-de49-4d8a-8f33-bf961fcea84b', CAST(N'2025-05-14T17:42:40.977' AS DateTime), N'20f56f48-de49-4d8a-8f33-bf961fcea84b', NULL, 0, N'Active', N'Rigs')
GO
INSERT [dbo].[TopicCategory] ([ID], [TopicName], [TopicDescription], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [Status], [CategoryType]) VALUES (N'D10E50A8-FDF4-4E12-B98D-828E2B20C657', N'Drills Bits', N'Drill bits are cutting tools at the end of the drill string used to break rock and create the wellbore, commonly classified as roller cone bits and fixed cutter bits.', N'20f56f48-de49-4d8a-8f33-bf961fcea84b', CAST(N'2025-05-04T13:07:26.130' AS DateTime), N'20f56f48-de49-4d8a-8f33-bf961fcea84b', NULL, 0, N'Active', N'CD2')
GO
INSERT [dbo].[TopicCategory] ([ID], [TopicName], [TopicDescription], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn], [IsDeleted], [Status], [CategoryType]) VALUES (N'D1D8C761-2349-4752-8E11-E6DB876A7138', N'Kelly & Top Drives', N'Kelly and top drives are systems used to rotate the drill string, with Kelly being manual and top drive being motorized and more efficient.
', N'20f56f48-de49-4d8a-8f33-bf961fcea84b', CAST(N'2025-05-04T13:06:04.820' AS DateTime), N'20f56f48-de49-4d8a-8f33-bf961fcea84b', NULL, 0, N'Active', N'CD2')
GO
INSERT [dbo].[TopicSubCategory] ([SubTopicID], [CatID], [SubTopicName], [Description], [CreatedOn], [IsDeleted]) VALUES (N'068C0626-0982-49CA-9CEF-7D7F08287A7C', N'D1D8C761-2349-4752-8E11-E6DB876A7138', N'Kelly Systems', N'The Kelly system uses a rotary table on the rig floor to turn a Kelly bar, which in turn rotates the drill string.
It is a traditional method that requires more manual handling and is slower compared to top drive systems.', CAST(N'2025-05-04T21:50:24.573' AS DateTime), 0)
GO
INSERT [dbo].[TopicSubCategory] ([SubTopicID], [CatID], [SubTopicName], [Description], [CreatedOn], [IsDeleted]) VALUES (N'3A5F4A8A-0DE7-498D-A614-41DE0502CC91', N'D1D8C761-2349-4752-8E11-E6DB876A7138', N'OverView', N'Kelly drive is a traditional drilling system using a rotary table and a Kelly bar to rotate the drill string.
Top drive is a modern system that rotates the drill string from above, offering faster, safer, and more efficient drilling.', CAST(N'2025-05-04T21:17:20.007' AS DateTime), 0)
GO
INSERT [dbo].[TopicSubCategory] ([SubTopicID], [CatID], [SubTopicName], [Description], [CreatedOn], [IsDeleted]) VALUES (N'3C100AD3-8891-4B56-AE95-645FC40A0D30', N'6D292746-B966-435F-9DF5-DAD699657555', N'Drillships', N'Drillships are advanced floating rigs with a ship-like design, equipped with dynamic positioning systems, used for drilling in deepwater and ultra-deepwater environments.
', CAST(N'2025-05-04T13:19:41.580' AS DateTime), 0)
GO
INSERT [dbo].[TopicSubCategory] ([SubTopicID], [CatID], [SubTopicName], [Description], [CreatedOn], [IsDeleted]) VALUES (N'538097F7-E9F0-43AF-9455-CEB3F25AC9D4', N'D1D8C761-2349-4752-8E11-E6DB876A7138', N'Top Drive System', N'The Top Drive system replaces the rotary table and Kelly bar by rotating the drill string from the top of the rig.
It enhances drilling efficiency, safety, and control, especially in deep or directional wells.', CAST(N'2025-05-04T21:20:18.727' AS DateTime), 0)
GO
INSERT [dbo].[TopicSubCategory] ([SubTopicID], [CatID], [SubTopicName], [Description], [CreatedOn], [IsDeleted]) VALUES (N'6C94A32D-DCD5-41D6-84C6-4693AB10CDFF', N'D1D8C761-2349-4752-8E11-E6DB876A7138', N'Top Drive Operation', N'Top drive operation involves a motorized unit suspended from the rig’s derrick that rotates the drill string while allowing vertical movement.
It enables continuous drilling with longer pipe sections, improves control, and reduces manual pipe handling.', CAST(N'2025-05-04T21:24:43.057' AS DateTime), 0)
GO
INSERT [dbo].[TopicSubCategory] ([SubTopicID], [CatID], [SubTopicName], [Description], [CreatedOn], [IsDeleted]) VALUES (N'7DB32372-0E4C-498F-BB25-6F6872A1FA78', N'6D292746-B966-435F-9DF5-DAD699657555', N'Semi-submersible', N'Semi-submersible rigs are floating offshore drilling units that are partially submerged, providing stability in deep waters by using buoyant pontoons and columns.', CAST(N'2025-05-04T13:17:31.393' AS DateTime), 0)
GO
INSERT [dbo].[TopicSubCategory] ([SubTopicID], [CatID], [SubTopicName], [Description], [CreatedOn], [IsDeleted]) VALUES (N'83C9A8AF-8E16-4FDF-A13B-BB35BF5D5F7B', N'D1D8C761-2349-4752-8E11-E6DB876A7138', N'Kelly operation', N'Kelly operation involve rotating the drill string using a Kelly bar driven by the rotary table, while the bar moves vertically as drilling progresses.
This method requires connecting one pipe at a time and more manual intervention, making it slower and less efficient than top drive systems.', CAST(N'2025-05-04T21:51:04.710' AS DateTime), 0)
GO
INSERT [dbo].[TopicSubCategory] ([SubTopicID], [CatID], [SubTopicName], [Description], [CreatedOn], [IsDeleted]) VALUES (N'9512CF9E-55D5-4E37-84A7-999DC6C68C5D', N'6D292746-B966-435F-9DF5-DAD699657555', N'Mobilizing Land Rigs', N'Mobilizing land rigs involves transporting, assembling, and setting up rig components at the drilling site, requiring careful planning, logistics, and safety measures.
', CAST(N'2025-05-04T13:13:21.600' AS DateTime), 0)
GO
INSERT [dbo].[TopicSubCategory] ([SubTopicID], [CatID], [SubTopicName], [Description], [CreatedOn], [IsDeleted]) VALUES (N'AD301C0F-E391-46A4-AE31-DBD923715FA4', N'D1D8C761-2349-4752-8E11-E6DB876A7138', N'Makin'' Hole', N'Kelly drive uses a rotary table to turn the drill string via a kelly bar, requiring frequent stops.
Top drive rotates the drill string from above, allowing faster, continuous drilling with better control.', CAST(N'2025-05-04T20:31:00.823' AS DateTime), 0)
GO
INSERT [dbo].[TopicSubCategory] ([SubTopicID], [CatID], [SubTopicName], [Description], [CreatedOn], [IsDeleted]) VALUES (N'B5A251B4-8442-4C49-A1FC-A270DF5005F1', N'6D292746-B966-435F-9DF5-DAD699657555', N'Overview', N'Rig types in oil and gas include land rigs (used onshore), jack-up rigs (for shallow offshore), semi-submersible rigs (for deeper waters), drillships (deepwater mobile rigs), and platform rigs (fixed offshore structures).', CAST(N'2025-05-04T13:09:34.330' AS DateTime), 0)
GO
INSERT [dbo].[TopicSubCategory] ([SubTopicID], [CatID], [SubTopicName], [Description], [CreatedOn], [IsDeleted]) VALUES (N'C2B36204-9CDC-427F-A225-06C06CBDE2E6', N'724710A8-3B21-4A9E-A260-8BAE5F297E19', N'demo sub topics', N'its for demo sub topics', CAST(N'2025-05-14T17:43:36.480' AS DateTime), 0)
GO
INSERT [dbo].[TopicSubCategory] ([SubTopicID], [CatID], [SubTopicName], [Description], [CreatedOn], [IsDeleted]) VALUES (N'E258D50B-1E0A-4C40-BC09-77CDADBDD303', N'6D292746-B966-435F-9DF5-DAD699657555', N'Land Rigs', N'Drilling rigs like these bore or drill holes into the earth.
   Usually they drill to find oil and gas.
   They work both on land and offshore.
   Some are big and some are relatively small.
   Big rigs drill very deep holes, 20,000 feet, 7,000 meters or more.

   Small rigs may only drill to a few thousand feet or meters.
   eople in the oil industry group rigs into six basic types.
   Land, jackup, platform, submersible, semi-submersible, and drill ship.
   A land rig drills on dry land.They''re the most common rig.
   Light-duty rigs drill holes from about 3,000 to 5,000 feet deep 1,000 to 1,500 meters.
   Medium-duty rigs drill to depths ranging from about 4,000 to 10,000 feet or 1,200 to 3,000 meters.
   Heavy-duty rigs drill holes from about 12,000 to 16,000 feet deep or 3,500 to 5,000 meters.
   Ultra-heavy-duty rigs drill holes from about 18,000 to 25,000 feet or 5,500 to 7,500 meters or more.

   Crew members can move land rigs on trucks, tractors, trailers, barges, helicopters, heavy rolling gear, skids, and in rare cases, on specialized air pressurized equipment.
   Small light-duty rigs are pretty simple to move. Ultra-heavy land rigs can be difficult to move.
   A jackup rig drills offshore wells. It has legs that support a deck and hull.
   When positioned over the drilling site, the bottom of the legs rest on the seafloor.', CAST(N'2025-05-04T13:11:10.517' AS DateTime), 0)
GO
INSERT [dbo].[TopicSubCategory] ([SubTopicID], [CatID], [SubTopicName], [Description], [CreatedOn], [IsDeleted]) VALUES (N'ED4FAFFB-6844-4C9F-83A8-E24E312ED820', N'6D292746-B966-435F-9DF5-DAD699657555', N'Submersibles', N'Submersible rigs are floating offshore drilling units designed to operate in deep waters, with their hulls partially submerged to provide stability in rough sea conditions.
', CAST(N'2025-05-04T13:16:46.060' AS DateTime), 0)
GO
INSERT [dbo].[TopicSubCategory] ([SubTopicID], [CatID], [SubTopicName], [Description], [CreatedOn], [IsDeleted]) VALUES (N'F5746B50-5270-4DA8-9127-5C00CBBDCADC', N'6D292746-B966-435F-9DF5-DAD699657555', N'Top Drive Operation', N'Top drive operation involves a motorized unit suspended from the rig’s derrick that rotates the drill string while allowing vertical movement.
It enables continuous drilling with longer pipe sections, improves control, and reduces manual pipe handling.', CAST(N'2025-05-04T21:21:13.473' AS DateTime), 0)
GO
INSERT [dbo].[TopicSubCategory] ([SubTopicID], [CatID], [SubTopicName], [Description], [CreatedOn], [IsDeleted]) VALUES (N'F8C823F0-C930-4EF2-8747-18F68D6EC1A7', N'6D292746-B966-435F-9DF5-DAD699657555', N'Platform rigs', N'Platform rigs are fixed offshore structures used for drilling in shallow waters, providing a stable base for drilling operations and support for production equipment.
', CAST(N'2025-05-04T13:15:41.900' AS DateTime), 0)
GO
INSERT [dbo].[UserContentViewHistory] ([ID], [UserID], [MediaID], [ViewedOn]) VALUES (N'd37ea8ec-5007-4dd5-8686-742cbd403d2c', N'c88f74b6-9c41-4f13-9c7e-ace65748a54e', N'157c3258-65c2-42c5-936a-55b2c6d94010', CAST(N'2025-05-18T18:17:42.433' AS DateTime))
GO
INSERT [dbo].[UserContentViewHistory] ([ID], [UserID], [MediaID], [ViewedOn]) VALUES (N'fea9df46-f369-45b8-94b5-c36c14bab3b0', N'c88f74b6-9c41-4f13-9c7e-ace65748a54e', N'84fefe14-d34e-436b-af5c-670491c0f031', CAST(N'2025-05-18T16:30:40.153' AS DateTime))
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [Address]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [ContactInfo]
GO
ALTER TABLE [dbo].[Media] ADD  DEFAULT (getdate()) FOR [UploadedOn]
GO
ALTER TABLE [dbo].[Media] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Quiz] ADD  DEFAULT ((0)) FOR [Isdelete]
GO
ALTER TABLE [dbo].[Quiz] ADD  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[Quiz] ADD  DEFAULT ('Active') FOR [Qstatus]
GO
ALTER TABLE [dbo].[QuizAnswer] ADD  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[QuizAnswer] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[TopicCategory] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[TopicCategory] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[TopicCategory] ADD  DEFAULT ('Active') FOR [Status]
GO
ALTER TABLE [dbo].[TopicSubCategory] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[TopicSubCategory] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[UserAnswers] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[UserContentViewHistory] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[UserContentViewHistory] ADD  DEFAULT (getdate()) FOR [ViewedOn]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
/****** Object:  StoredProcedure [dbo].[AllQuizAnswers]    Script Date: 5/18/2025 7:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AllQuizAnswers]
as
select * from QuizAnswer
GO
/****** Object:  StoredProcedure [dbo].[AllQuizQuestion]    Script Date: 5/18/2025 7:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[AllQuizQuestion]
as
select
ID
,CatId
,QuestionMedia
,Isdelete
,createdOn
,Title
,Qstatus
from Quiz where Isdelete=0
GO
/****** Object:  StoredProcedure [dbo].[DeleteMedia]    Script Date: 5/18/2025 7:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteMedia]  
   
	@MediaId VARCHAR(100)
AS  
BEGIN  
    SET NOCOUNT ON;  
  
	Update Media set IsDeleted=1 where MediaID=@MediaId
  
END  
GO
/****** Object:  StoredProcedure [dbo].[EditMedia]    Script Date: 5/18/2025 7:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditMedia]  
    @SubTopicID VARCHAR(100),  
    @MediaType VARCHAR(50),  
    @MediaURL NVARCHAR(MAX),  
    @Title NVARCHAR(255),
	@MediaId VARCHAR(100)
AS  
BEGIN  
    SET NOCOUNT ON;  
  
	Update Media set SubTopicID=@SubTopicID,MediaType=@MediaType,MediaURL=@MediaURL,Title=@Title where MediaID=@MediaId
  
END  
GO
/****** Object:  StoredProcedure [dbo].[GetActiveColor]    Script Date: 5/18/2025 7:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetActiveColor]
as
select Themecolor from Themecolor
GO
/****** Object:  StoredProcedure [dbo].[GetAllChapterType]    Script Date: 5/18/2025 7:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAllChapterType]
as
Select ChName from ChapterType
GO
/****** Object:  StoredProcedure [dbo].[GetAllMedia]    Script Date: 5/18/2025 7:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAllMedia]    
as    
select MediaID,    
T.SubTopicID as SubTopicID, 
T.SubTopicName as SubTopicName  
,M.MediaType    
,M.MediaURL    
,M.Title    
,M.UploadedOn,    
M.IsDeleted from Media M join TopicSubCategory T on T.SubTopicID=M.SubTopicID where M.IsDeleted=0
GO
/****** Object:  StoredProcedure [dbo].[InsertIntochapter]    Script Date: 5/18/2025 7:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertIntochapter] @ChapterName varchar(100)
as
Insert into ChapterType values(NewId(),@ChapterName)
GO
/****** Object:  StoredProcedure [dbo].[InsertMedia]    Script Date: 5/18/2025 7:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertMedia]
    @SubTopicID VARCHAR(100),
    @MediaType VARCHAR(50),
    @MediaURL NVARCHAR(MAX),
    @Title NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Media (MediaID, SubTopicID, MediaType, MediaURL, Title, UploadedOn, IsDeleted)
    VALUES (
        NEWID(),          -- Generate new GUID
        @SubTopicID,
        @MediaType,
        @MediaURL,
        @Title,
        GETDATE(),        -- Current server DateTime
        0                 -- False
    );
END
GO
/****** Object:  StoredProcedure [dbo].[InsertQuestion]    Script Date: 5/18/2025 7:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertQuestion]
    @CatId varchar(100),
    @Title NVARCHAR(max),
    @QuestionMedia NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO Quiz(ID,CatId, Title, QuestionMedia)
    VALUES (newid(),@CatId, @Title, @QuestionMedia);
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertQuizAnswer]    Script Date: 5/18/2025 7:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertQuizAnswer]
    @QuestionID varchar(100),
    @AnswerText NVARCHAR(MAX),
    @IsCorrect BIT,
    @AnswerMedia NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    -- Check current answer count for this question
    IF (SELECT COUNT(*) FROM QuizAnswer WHERE QuestionID = @QuestionID AND IsDelete = 0) >= 4
    BEGIN
        select 'Only 4 answers are allowed per question.' as [Message];
        RETURN;
    END

    -- Insert new answer
    INSERT INTO QuizAnswer (
        AnswerID,
        QuestionID,
        AnswerText,
        IsCorrect,
        IsDelete,
        CreatedOn,
        AnswerMedia
    )
    VALUES (
        NEWID(),
        @QuestionID,
        @AnswerText,
        @IsCorrect,
        0,
        GETDATE(),
        @AnswerMedia
    );
	    select 'Success' as [Message];
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertUserContentViewHistory]    Script Date: 5/18/2025 7:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertUserContentViewHistory]
    @UserID UNIQUEIDENTIFIER,
    @MediaID UNIQUEIDENTIFIER
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO UserContentViewHistory (UserID, MediaID)
    VALUES (@UserID, @MediaID);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteSubTopic]    Script Date: 5/18/2025 7:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteSubTopic]    
    @ID NVARCHAR(255)  
AS    
BEGIN    
   Update TopicSubCategory set IsDeleted=1  where SubTopicID =@ID  
   select 'Success'  
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetActiveTopicCategories]    Script Date: 5/18/2025 7:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetActiveTopicCategories]    
AS    
BEGIN    
    SET NOCOUNT ON;    
    
    SELECT     
        TC.ID,    
        TC.TopicName,    
        TC.TopicDescription,    
        TC.CreatedBy,    
        U.DisplayName AS CreatedByName,    
        TC.CreatedOn,    
        TC.IsDeleted,   
  TC.CategoryType,  
        TC.Status    
    FROM     
        TopicCategory TC    
    INNER JOIN     
        aspnetusers U ON TC.CreatedBy = U.Id    
    WHERE     
        TC.IsDeleted = 0     
        AND TC.Status = 'Active'
		order by TC.CreatedOn
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSubTopics]    Script Date: 5/18/2025 7:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetSubTopics]    
    @UserId VARCHAR(100) = NULL
AS    
BEGIN    
    SET NOCOUNT ON;

    SELECT    
        TS.SubTopicID,    
        TC.TopicName,    
        TS.SubTopicName,    
        TS.Description,    
        TS.CreatedOn,    
        TS.IsDeleted,
        CASE 
            WHEN @UserId IS NOT NULL AND UCVH.MediaID IS NOT NULL THEN CAST(1 AS BIT)
            ELSE CAST(0 AS BIT)
        END AS ViewStatus
    FROM 
        TopicSubCategory TS
    JOIN 
        TopicCategory TC ON TC.ID = TS.CatID
    LEFT JOIN 
        Media M ON M.SubTopicID = TS.SubTopicID
    LEFT JOIN 
        UserContentViewHistory UCVH 
            ON M.MediaID = UCVH.MediaID AND UCVH.UserID = @UserId
    WHERE 
        TS.IsDeleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertSubTopic]    Script Date: 5/18/2025 7:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertSubTopic]
    @CatID NVARCHAR(255),
    @SubTopicName NVARCHAR(255),
    @Description NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO TopicSubCategory (
        SubTopicID,
        CatID,
        SubTopicName,
        Description,
        CreatedOn,
        IsDeleted
    )
    VALUES (
        NEWID(),             -- Generate a unique ID
        @CatID,
        @SubTopicName,
        @Description,
        GETDATE(),            -- Set current timestamp
        0                     -- IsDeleted = 0 (false)
    );
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertTopicCategory]    Script Date: 5/18/2025 7:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertTopicCategory]  
    @TopicName VARCHAR(255),  
    @TopicDescription TEXT,  
    @CreatedBy VARCHAR(100),
	@CategoryType varchar(100)
AS  
BEGIN  
    SET NOCOUNT ON;  
  
    BEGIN TRY  
        INSERT INTO TopicCategory (  
            ID,  
            TopicName,  
            TopicDescription,  
            CreatedBy,  
            UpdatedBy,
			CategoryType
        )  
        VALUES (  
            NEWID(),  
            @TopicName,  
            @TopicDescription,  
            @CreatedBy,  
            @CreatedBy,
			@CategoryType
        );  
  
        -- Return success message  
        SELECT 'Success' AS Message;  
    END TRY  
    BEGIN CATCH  
        -- Return error message  
        SELECT   
            'Error: ' + ERROR_MESSAGE() AS Message  
             
    END CATCH  
END;  
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateDeleteCategory]    Script Date: 5/18/2025 7:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateDeleteCategory]  
    @ID UNIQUEIDENTIFIER
AS  
BEGIN  
    SET NOCOUNT ON;  

    BEGIN TRY  
        UPDATE TopicCategory  
        SET  
            IsDeleted=1
        WHERE  
            ID = @ID;  

        -- Return success message  
        SELECT 'Success' AS Message;  
    END TRY  
    BEGIN CATCH  
        -- Return error message  
        SELECT 'Error: ' + ERROR_MESSAGE() AS Message;  
    END CATCH  
END;  
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateSubTopic]    Script Date: 5/18/2025 7:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateSubTopic]  
   
    @CatID NVARCHAR(255),  
 @SubTopicID NVARCHAR(255),  
    @SubTopicName NVARCHAR(255),    
    @Description NVARCHAR(MAX)    
AS    
BEGIN    
    Update TopicSubCategory set CatID=@CatID,SubTopicName=@SubTopicName,Description=@Description where SubTopicID=@SubTopicID  
 select 'Success'  
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateTopicCategory]    Script Date: 5/18/2025 7:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateTopicCategory]    
    @ID UNIQUEIDENTIFIER,    
    @TopicName VARCHAR(255),    
    @TopicDescription TEXT,    
    @UpdatedBy VARCHAR(100),
	@CategoryType varchar(100)
AS    
BEGIN    
    SET NOCOUNT ON;    
  
    BEGIN TRY    
        UPDATE TopicCategory    
        SET    
            TopicName = @TopicName,    
            TopicDescription = @TopicDescription,    
            UpdatedBy = @UpdatedBy, CategoryType=@CategoryType   
        WHERE    
            ID = @ID;    
  
        -- Return success message    
        SELECT 'Success' AS Message;    
    END TRY    
    BEGIN CATCH    
        -- Return error message    
        SELECT 'Error: ' + ERROR_MESSAGE() AS Message;    
    END CATCH    
END;    
GO
/****** Object:  StoredProcedure [dbo].[SubmitUserAnswer]    Script Date: 5/18/2025 7:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SubmitUserAnswer] 
    @AnswerID VARCHAR(100),
    @UserID VARCHAR(100)
AS
BEGIN
    DECLARE @QuestionID VARCHAR(100);
    DECLARE @IsCorrect BIT;

    -- Get the related QuestionID and IsCorrect from QuizAnswer table
    SELECT 
        @QuestionID = QuestionID,
        @IsCorrect = IsCorrect
    FROM QuizAnswer 
    WHERE AnswerID = @AnswerID;

    -- Insert into UserAnswers table
    INSERT INTO UserAnswers (SelectdAnswerID, UserID, QuestionID, IsTrue)
    VALUES (@AnswerID, @UserID, @QuestionID, @IsCorrect);
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateThemeColor]    Script Date: 5/18/2025 7:28:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateThemeColor]
@Color varchar(100)
as
update ThemeColor set ThemeColor=@Color
GO
