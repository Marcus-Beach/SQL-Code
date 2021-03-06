USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[CreateTagSP]    Script Date: 1/21/2020 7:39:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/21/2020
-- Description:	Update Tag Name SP
-- =============================================
CREATE PROCEDURE [dbo].[UpdateTagNameSP](@USERID AS INT, @TAGID AS INT, @NAME AS NVARCHAR(50), @TRANSID AS INT = NULL)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    UPDATE Tags
	SET Name = @NAME
	IF @TRANSID IS NULL
	BEGIN
		INSERT INTO Transactions(UserID, TagID, Date)
		VALUES (@USERID, @TAGID, GETDATE())
		SET @TRANSID = @@IDENTITY
	END
	ELSE
	BEGIN
		UPDATE Transactions SET UserID = @USERID, TagID = TagID
	END
	SELECT @TRANSID
END
