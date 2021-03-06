USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[GetFriendsSP]    Script Date: 1/21/2020 6:14:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/21/2020
-- Description:	Get Friends by Tag SP
-- =============================================
ALTER PROCEDURE [dbo].[GetFriendsByTagSP](@USERID AS INT, @TAGID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * FROM Users u 
	JOIN Friends f ON u.ID = f.FriendID
	JOIN Transactions tr ON f.FriendID = tr.FriendID
	WHERE f.UserID = @USERID and tr.TagID = @TAGID and f.Confirmed = 1
END
