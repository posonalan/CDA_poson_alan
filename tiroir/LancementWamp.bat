echo off
NET STOP branchCache
NET START wampapache64
NET START wampmysqld64
NET START wampmariadbd64
start c:\wamp64\wampmanager.exe