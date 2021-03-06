USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[GetFriendsSP]    Script Date: 1/21/2020 6:20:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/15/2020
-- Description:	Get Friends SP
-- =============================================
ALTER PROCEDURE [dbo].[GetFriendsSP](@USERID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * FROM Users u JOIN Friends f ON u.ID = f.FriendID WHERE f.UserID = @USERID AND f.Confirmed = 1
END
