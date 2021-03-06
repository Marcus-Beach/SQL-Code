USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[GetUserSP]    Script Date: 1/15/2020 9:12:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/15/2020
-- Description:	Get User By Email SP
-- =============================================
CREATE PROCEDURE [dbo].[GetUserByEmailSP](@USEREMAIL AS NVARCHAR(50))
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * FROM Users WHERE Email = @USEREMAIL
END
