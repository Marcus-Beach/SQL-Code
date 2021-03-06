USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[GetTagsByFriendSP]    Script Date: 1/21/2020 7:55:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/21/2020
-- Description:	Delete Tag SP
-- =============================================
CREATE PROCEDURE [dbo].[DeleteTagSP](@TAGID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DELETE FROM Tags WHERE LocalID = @TAGID
END