SELECT a."TagName", a."Description", a."SigType",
a."EuUnit", a."EuLo", a."EuHi", a."LimitLoLo",
a."LimitLo", a."LimitHi", a."LimitHiHi",
b."TimeStamp", b."Value", b."Quality"
FROM "TagMaster" a, "TagValue" b WHERE a."TagName" = b."TagName";