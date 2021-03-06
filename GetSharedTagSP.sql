USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[GetTagSP]    Script Date: 1/20/2020 7:39:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/20/2020
-- Description:	Get Shared Tag SP
-- =============================================
ALTER PROCEDURE [dbo].[GetSharedTagSP](@TAGID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * FROM Tags WHERE SharedID = @TAGID
END