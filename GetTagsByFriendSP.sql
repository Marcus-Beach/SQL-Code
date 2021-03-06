USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[GetTagsByFriendSP]    Script Date: 1/22/2020 7:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/21/2020
-- Description:	Get Tags By Friend SP
-- =============================================
ALTER PROCEDURE [dbo].[GetTagsByFriendSP](@USERID AS INT, @FRIENDID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * FROM Tags WHERE LocalID IN (SELECT TagID FROM Transactions WHERE UserID = @USERID AND FriendID = @FRIENDID)
END