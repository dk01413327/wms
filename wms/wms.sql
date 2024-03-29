USE [wms]
GO
/****** Object:  Table [dbo].[g_wo_schedule]    Script Date: 06/26/2019 11:30:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[g_wo_schedule](
	[schedule_id] [int] NOT NULL,
	[work_order] [varchar](50) NULL,
	[prod_line] [int] NULL,
	[prod_qty] [int] NULL,
	[prod_rate] [float] NULL,
	[start_time] [datetime] NULL,
	[updated_by] [int] NULL,
	[updated_time] [datetime] NULL,
 CONSTRAINT [PK_g_wo_schedule] PRIMARY KEY CLUSTERED 
(
	[schedule_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[g_wo_base]    Script Date: 06/26/2019 11:30:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[g_wo_base](
	[work_order] [varchar](50) NULL,
	[part_id] [int] NULL,
	[bom_ver] [varchar](10) NULL,
	[prod_qty] [int] NULL,
	[updated_by] [int] NULL,
	[updated_time] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[g_reel_info]    Script Date: 06/26/2019 11:30:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[g_reel_info](
	[reel_id] [varchar](10) NULL,
	[part_id] [int] NULL,
	[qty] [int] NULL,
	[lot_no] [varchar](10) NULL,
	[vendor_cd] [varchar](10) NULL,
	[created_by] [int] NULL,
	[created_time] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[g_part_station_m]    Script Date: 06/26/2019 11:30:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[g_part_station_m](
	[import_id] [int] NOT NULL,
	[part_id] [int] NULL,
	[prod_line] [int] NULL,
	[created_by] [int] NULL,
	[created_time] [datetime] NULL,
 CONSTRAINT [PK_g_part_station_m] PRIMARY KEY CLUSTERED 
(
	[import_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[g_part_station_d]    Script Date: 06/26/2019 11:30:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[g_part_station_d](
	[import_id] [int] NULL,
	[part_id] [int] NULL,
	[side] [varchar](10) NULL,
	[station] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sys_user]    Script Date: 06/26/2019 11:30:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sys_user](
	[user_id] [int] NOT NULL,
	[user_no] [varchar](10) NULL,
	[pass_word] [varchar](20) NOT NULL,
	[user_name] [nvarchar](50) NULL,
	[dept_name] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
	[cell_phone] [varchar](12) NULL,
	[enabled] [int] NULL,
	[created_time] [datetime] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sys_role_user]    Script Date: 06/26/2019 11:30:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_role_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NULL,
	[user_id] [int] NULL,
	[updated_by] [int] NULL,
	[updated_time] [datetime] NULL,
 CONSTRAINT [PK_sys_role_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_role_permission]    Script Date: 06/26/2019 11:30:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sys_role_permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NULL,
	[menu_id] [varchar](10) NULL,
	[permission] [varchar](10) NULL,
	[updated_by] [int] NULL,
	[updated_time] [datetime] NULL,
 CONSTRAINT [PK_sys_role_permission] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sys_role]    Script Date: 06/26/2019 11:30:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_role](
	[role_id] [int] NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
	[role_desc] [nvarchar](255) NULL,
	[enabled] [tinyint] NULL,
	[created_by] [int] NULL,
	[created_time] [datetime] NULL,
 CONSTRAINT [PK_sys_role] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sys_part]    Script Date: 06/26/2019 11:30:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sys_part](
	[part_id] [int] NOT NULL,
	[part_no] [varchar](50) NOT NULL,
	[part_name] [varchar](255) NULL,
	[model_name] [varchar](50) NULL,
	[pcb_qty] [tinyint] NULL,
	[updated_by] [int] NULL,
	[updated_time] [datetime] NULL,
 CONSTRAINT [PK_sys_part] PRIMARY KEY CLUSTERED 
(
	[part_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sys_menu]    Script Date: 06/26/2019 11:30:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sys_menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[menu_id] [varchar](10) NULL,
	[parent_id] [varchar](10) NULL,
	[menu_name] [nvarchar](25) NULL,
	[file_name] [varchar](25) NULL,
	[com_name] [varchar](25) NULL,
	[fun_desc] [nvarchar](255) NULL,
	[enabled] [tinyint] NULL,
	[dept_chk] [tinyint] NULL,
	[new_page] [tinyint] NULL,
	[menu_level] [tinyint] NULL,
	[menu_icon] [varchar](25) NULL,
	[need_chk] [tinyint] NULL,
	[table_name] [varchar](25) NULL,
	[updated_time] [datetime] NULL,
 CONSTRAINT [PK_sys_menu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sys_line]    Script Date: 06/26/2019 11:30:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sys_line](
	[line_id] [int] NOT NULL,
	[line_no] [varchar](10) NULL,
	[line_name] [varchar](50) NULL,
	[created_by] [int] NULL,
	[created_time] [datetime] NULL,
 CONSTRAINT [PK_sys_line] PRIMARY KEY CLUSTERED 
(
	[line_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sys_check_route]    Script Date: 06/26/2019 11:30:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sys_check_route](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[menu_id] [varchar](20) NULL,
	[chk_level] [tinyint] NULL,
	[chk_user] [tinyint] NULL,
	[need_mail] [tinyint] NULL,
	[updated_by] [int] NULL,
	[updated_time] [datetime] NULL,
 CONSTRAINT [PK_sys_check_route] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sys_bom_info]    Script Date: 06/26/2019 11:30:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sys_bom_info](
	[bom_id] [int] NOT NULL,
	[part_id] [int] NOT NULL,
	[bom_ver] [varchar](10) NOT NULL,
	[updated_by] [int] NULL,
	[updated_time] [datetime] NULL,
 CONSTRAINT [PK_sys_bom_info] PRIMARY KEY CLUSTERED 
(
	[bom_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sys_bom]    Script Date: 06/26/2019 11:30:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sys_bom](
	[bom_id] [int] NOT NULL,
	[item_part_id] [int] NOT NULL,
	[use_qty] [float] NOT NULL,
	[item_group] [varchar](10) NULL,
	[location] [varchar](255) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_save_user_role]    Script Date: 06/26/2019 11:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_save_user_role]
	-- Add the parameters for the stored procedure here
	@userid varchar(20), 
	@roles varchar(1000),
	@opuser int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    declare @id varchar(10),@str varchar(1000),@idx int;
    delete from sys_role_user where user_id=@userid;
    
	set @idx=charindex(',',@roles,1);
	set @id = SUBSTRING(@roles,0,@idx);
	set @str = substring(@roles,@idx+1,LEN(@roles));
	while @id != '' 
	begin
		insert into sys_role_user(user_id,role_id,updated_by) values (@userid,@id,@opuser);
		set @idx = charindex(',',@str,1);
		set @id = SUBSTRING(@roles,0,@idx);
		set @str = substring(@str,@idx+1,LEN(@str));
	end;
	if @str != ''
	  insert into sys_role_user(user_id,role_id,updated_by) values (@userid,@str,@opuser);
	select 0 as errcode ,'保存成功' as errmsg;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_save_user]    Script Date: 06/26/2019 11:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_save_user] 
	-- Add the parameters for the stored procedure here
	@userid int, 
	@userno varchar(20),
	@usernm varchar(50),
	@dept varchar(50),
	@email varchar(100),
	@phone varchar(12)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @maxid int,@cnt int = 0 ;
    if @userid > 0
	  update sys_user set user_name = @usernm,dept_name = @dept,email = @email,cell_phone = @phone where user_id= @userid;
	else
	begin
		select @cnt=count(1)from sys_user where user_no=@userno;
		if @cnt > 0 
		begin
			select 1 as errcode,'帐号重复' as errmsg;
			return;
		end;
		select @maxid = isnull(MAX(user_id),80000)+1 from sys_user;
		insert into sys_user(user_id,user_no,pass_word,user_name,dept_name,email,cell_phone) 
		values (@maxid,@userno,@userno,@usernm,@dept,@email,@phone);
	end ;
	select 0 as errcode,'保存成功' as errmsg;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_save_role_permission]    Script Date: 06/26/2019 11:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_save_role_permission]
	-- Add the parameters for the stored procedure here
	@roleid int, 
	@menuid varchar(10),
	@permission varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    declare @cnt int = 0;

	select @cnt=count(1) from sys_role_permission where role_id=@roleid and menu_id=@menuid;
	if @cnt = 0 
	  insert into sys_role_permission(role_id,menu_id,permission) values(@roleid,@menuid,@permission);
	else
	  update sys_role_permission set permission=@permission where role_id=@roleid and menu_id=@menuid;
	select 0 as errcode,'保存成功' as errmsg;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_save_role]    Script Date: 06/26/2019 11:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_save_role]
	-- Add the parameters for the stored procedure here
	@roleid int,
	@rolenm varchar(20), 
	@roledesc varchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    declare @cnt int = 0,@maxid int;

	if @roleid = 0 
	begin
	  select @cnt = count(1) from sys_role where role_name = @rolenm;
		if @cnt > 0 
		begin
		  select 1 as errcode,'角色名称重复' as errmsg;
		  return;
		end
		select @maxid = isnull(MAX(role_id),800)+1 from sys_role;
		insert into sys_role(role_id,role_name,role_desc) values (@maxid,@rolenm,@roledesc);
	end
	else
	begin
	  update sys_role set role_desc= @roledesc where role_id=@roleid;
	end ;
	select 0 as errcode,'保存成功' as errmsg ;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_save_chk_route]    Script Date: 06/26/2019 11:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_save_chk_route]
	-- Add the parameters for the stored procedure here
	@menuid varchar(10), 
	@users varchar(2000),
	@opuser int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    declare @str varchar(2000),@seq int = 1,@user varchar(5),@idx int
	set @idx= charindex(',',@users,1);
	set @user = SUBSTRING(@users,0,@idx)
	set @str = substring(@users,@idx+1,LEN(@users));

	delete from sys_check_route where menu_id=@menuid;
	while @user != '' 
	begin
			insert into sys_check_route(menu_id,chk_level,chk_user,updated_by) 
			 select @menuid,@seq,user_id,@opuser from sys_user where user_no=@user;
			
			set @idx=charindex(',',@str,1);
			set @user = SUBSTRING(@str,0,@idx)
			set @str = substring(@str,@idx+1,LEN(@str));
			set @seq = @seq + 1;
	end ;
	if @str != ''
	  insert into sys_check_route(menu_id,chk_level,chk_user,updated_by) 
			 select @menuid,@seq,user_id,@opuser from sys_user where user_no=@str;
	  
	select 0 as errcode,'保存成功' as errmsg;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_login]    Script Date: 06/26/2019 11:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_login]
	-- Add the parameters for the stored procedure here
	@userno varchar(20), 
	@password varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @cnt int ;
	select @cnt=count(1) from sys_user where user_no=@userno ;
	if @cnt = 0 
	begin
	  select 1 as errcode,'无此帐号' as errmsg;
	  return;
	end

	
	select @cnt=count(1) from sys_user where user_no=@userno and enabled=0 ;
	if @cnt > 0 
	begin
	  select 1 as errcode,'此人已离职' as errmsg;
	  return
	end
	
	select @cnt=count(1) from sys_user where user_no=@userno and pass_word=@password;
	if @cnt = 0 
	begin
	  select 1 as errcode,'密码不正确' as errmsg;
	  return
	end

	
	select 0 as errcode,user_id, user_no, user_name,dept_name from sys_user 
	  where user_no=@userno;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_get_sys_menu]    Script Date: 06/26/2019 11:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_sys_menu] 
	-- Add the parameters for the stored procedure here
	@userid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if @userid = 80001 
	  select a.menu_id,a.menu_name,a.parent_id,a.file_name,a.com_name,a.menu_level
		      ,a.menu_icon,a.menu_name as label,a.need_chk,'1111111' as permission,a.new_page
		from sys_menu a where parent_id !='root' order by parent_id,menu_id;
	else
	  	select a.menu_id,a.menu_name,a.parent_id,a.file_name,a.com_name,a.menu_level,a.menu_icon,a.menu_name as label,a.need_chk
			   ,(bquery+badd+bedit+bdelete+bapprove+bexport+bprint) permission ,a.new_page
			from  sys_menu a join (
						select menu_id,max(substring(permission,1,1)) bquery,max(substring(permission,2,1)) badd,max(substring(permission,3,1)) bedit
									,max(substring(permission,4,1)) bdelete,max(substring(permission,5,1)) bapprove,max(substring(permission,6,1)) bexport
									,max(substring(permission,7,1)) bprint
						from sys_role_permission a  join sys_role_user b on a.role_id=b.role_id
						where b.user_id=@userid and a.permission>'0000000' group by menu_id
				) b on a.menu_id=b.menu_id where a.enabled=1
		union 
		  select a.menu_id,a.menu_name,a.parent_id,a.file_name,a.com_name,a.menu_level,a.menu_icon,a.menu_name as label,a.need_chk
		        ,'',a.new_page from sys_menu a
			where parent_id='M' 
				and exists(select 1 from sys_role_permission b  join sys_role_user c on b.role_id=c.role_id
							where c.user_id=@userid and b.permission>'0000000' 
							and charindex(b.menu_id,a.menu_id)>0) order by parent_id,menu_id;

	 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_change_password]    Script Date: 06/26/2019 11:30:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[sp_change_password]
	-- Add the parameters for the stored procedure here
	@userid int, 
	@oldpass varchar(20),
	@newpass varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @cnt int = 0;
	select @cnt = count(1) from sys_user where user_id=@userid and pass_word = @oldpass;
	if @cnt =  0
	begin
	  select 1 as errcode,'旧密码不正确' as errmsg;
	  return;
	end else
	begin
	  update sys_user set pass_word = @newpass where user_id=@userid;
	end;
	select 0 as errcode,'修改成功' as errmsg;
END
GO
/****** Object:  Default [DF_sys_check_route_need_mail]    Script Date: 06/26/2019 11:30:37 ******/
ALTER TABLE [dbo].[sys_check_route] ADD  CONSTRAINT [DF_sys_check_route_need_mail]  DEFAULT ((0)) FOR [need_mail]
GO
/****** Object:  Default [DF_sys_check_route_updated_time]    Script Date: 06/26/2019 11:30:37 ******/
ALTER TABLE [dbo].[sys_check_route] ADD  CONSTRAINT [DF_sys_check_route_updated_time]  DEFAULT (getdate()) FOR [updated_time]
GO
/****** Object:  Default [DF_sys_line_created_time]    Script Date: 06/26/2019 11:30:37 ******/
ALTER TABLE [dbo].[sys_line] ADD  CONSTRAINT [DF_sys_line_created_time]  DEFAULT (getdate()) FOR [created_time]
GO
/****** Object:  Default [DF_sys_menu_enabled]    Script Date: 06/26/2019 11:30:37 ******/
ALTER TABLE [dbo].[sys_menu] ADD  CONSTRAINT [DF_sys_menu_enabled]  DEFAULT ((1)) FOR [enabled]
GO
/****** Object:  Default [DF_sys_menu_dept_chk]    Script Date: 06/26/2019 11:30:37 ******/
ALTER TABLE [dbo].[sys_menu] ADD  CONSTRAINT [DF_sys_menu_dept_chk]  DEFAULT ((0)) FOR [dept_chk]
GO
/****** Object:  Default [DF_sys_menu_new_page]    Script Date: 06/26/2019 11:30:37 ******/
ALTER TABLE [dbo].[sys_menu] ADD  CONSTRAINT [DF_sys_menu_new_page]  DEFAULT ((0)) FOR [new_page]
GO
/****** Object:  Default [DF_sys_menu_menu_level]    Script Date: 06/26/2019 11:30:37 ******/
ALTER TABLE [dbo].[sys_menu] ADD  CONSTRAINT [DF_sys_menu_menu_level]  DEFAULT ((2)) FOR [menu_level]
GO
/****** Object:  Default [DF_sys_menu_need_chk]    Script Date: 06/26/2019 11:30:37 ******/
ALTER TABLE [dbo].[sys_menu] ADD  CONSTRAINT [DF_sys_menu_need_chk]  DEFAULT ((0)) FOR [need_chk]
GO
/****** Object:  Default [DF_sys_menu_updated_time]    Script Date: 06/26/2019 11:30:37 ******/
ALTER TABLE [dbo].[sys_menu] ADD  CONSTRAINT [DF_sys_menu_updated_time]  DEFAULT (getdate()) FOR [updated_time]
GO
/****** Object:  Default [DF_sys_part_updated_time]    Script Date: 06/26/2019 11:30:37 ******/
ALTER TABLE [dbo].[sys_part] ADD  CONSTRAINT [DF_sys_part_updated_time]  DEFAULT (getdate()) FOR [updated_time]
GO
/****** Object:  Default [DF_sys_role_enabled]    Script Date: 06/26/2019 11:30:37 ******/
ALTER TABLE [dbo].[sys_role] ADD  CONSTRAINT [DF_sys_role_enabled]  DEFAULT ((1)) FOR [enabled]
GO
/****** Object:  Default [DF_sys_role_created_time]    Script Date: 06/26/2019 11:30:37 ******/
ALTER TABLE [dbo].[sys_role] ADD  CONSTRAINT [DF_sys_role_created_time]  DEFAULT (getdate()) FOR [created_time]
GO
/****** Object:  Default [DF_sys_role_permission_updated_time]    Script Date: 06/26/2019 11:30:37 ******/
ALTER TABLE [dbo].[sys_role_permission] ADD  CONSTRAINT [DF_sys_role_permission_updated_time]  DEFAULT (getdate()) FOR [updated_time]
GO
/****** Object:  Default [DF_sys_role_user_updated_time]    Script Date: 06/26/2019 11:30:37 ******/
ALTER TABLE [dbo].[sys_role_user] ADD  CONSTRAINT [DF_sys_role_user_updated_time]  DEFAULT (getdate()) FOR [updated_time]
GO
/****** Object:  Default [DF_sys_user_enabled]    Script Date: 06/26/2019 11:30:37 ******/
ALTER TABLE [dbo].[sys_user] ADD  CONSTRAINT [DF_sys_user_enabled]  DEFAULT ((1)) FOR [enabled]
GO
/****** Object:  Default [DF_sys_user_created_time]    Script Date: 06/26/2019 11:30:37 ******/
ALTER TABLE [dbo].[sys_user] ADD  CONSTRAINT [DF_sys_user_created_time]  DEFAULT (getdate()) FOR [created_time]
GO
