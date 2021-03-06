USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[GetSettingSP]    Script Date: 1/20/2020 7:40:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/20/2020
-- Description:	Get Shared Setting SP
-- =============================================
CREATE PROCEDURE [dbo].[GetSharedSettingSP](@SETTINGID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * FROM Settings WHERE SharedID = @SETTINGID
END