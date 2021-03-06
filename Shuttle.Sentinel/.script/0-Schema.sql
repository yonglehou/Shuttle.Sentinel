﻿SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Session]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Session](
	[Token] [uniqueidentifier] NOT NULL,
	[EMail] [varchar](254) NOT NULL,
	[DateRegistered] [datetime] NOT NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY NONCLUSTERED 
(
	[Token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SessionPermission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SessionPermission](
	[Token] [uniqueidentifier] NOT NULL,
	[Permission] [varchar](130) NOT NULL,
 CONSTRAINT [PK_SessionPermission] PRIMARY KEY CLUSTERED 
(
	[Token] ASC,
	[Permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemParameter]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SystemParameter](
	[ParameterName] [varchar](65) NOT NULL,
	[ParameterValue] [varchar](130) NOT NULL,
 CONSTRAINT [PK_SystemParameter] PRIMARY KEY CLUSTERED 
(
	[ParameterName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemRole]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SystemRole](
	[Id] [uniqueidentifier] NOT NULL,
	[RoleName] [varchar](130) NOT NULL,
 CONSTRAINT [PK_SystemRole] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemRolePermission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SystemRolePermission](
	[RoleId] [uniqueidentifier] NOT NULL,
	[PermissionUri] [varchar](130) NOT NULL,
 CONSTRAINT [PK_SystemRolePermission] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[PermissionUri] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemUser]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SystemUser](
	[Id] [uniqueidentifier] NOT NULL,
	[EMail] [varchar](254) NOT NULL,
	[DateRegistered] [datetime] NOT NULL,
	[RegisteredBy] [varchar](65) NOT NULL,
	[DateActivated] [datetime] NULL,
 CONSTRAINT [PK_SystemUser] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemUserRole]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SystemUserRole](
	[UserId] [uniqueidentifier] NOT NULL,
	[SystemRoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_SystemUserRole] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[SystemRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Session]') AND name = N'IX_Session')
CREATE UNIQUE NONCLUSTERED INDEX [IX_Session] ON [dbo].[Session]
(
	[EMail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SystemRole]') AND name = N'IX_SystemRole')
CREATE UNIQUE NONCLUSTERED INDEX [IX_SystemRole] ON [dbo].[SystemRole]
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[SystemUser]') AND name = N'IX_SystemUser')
CREATE UNIQUE NONCLUSTERED INDEX [IX_SystemUser] ON [dbo].[SystemUser]
(
	[EMail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DF_Session_DateRegistered]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Session] ADD  CONSTRAINT [DF_Session_DateRegistered]  DEFAULT (getdate()) FOR [DateRegistered]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SessionPermission_Session]') AND parent_object_id = OBJECT_ID(N'[dbo].[SessionPermission]'))
ALTER TABLE [dbo].[SessionPermission]  WITH CHECK ADD  CONSTRAINT [FK_SessionPermission_Session] FOREIGN KEY([Token])
REFERENCES [dbo].[Session] ([Token])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SessionPermission_Session]') AND parent_object_id = OBJECT_ID(N'[dbo].[SessionPermission]'))
ALTER TABLE [dbo].[SessionPermission] CHECK CONSTRAINT [FK_SessionPermission_Session]
GO
