# Recovering Google Authenticator keys from Android device for backup

## Prerequistes

* Computer requires _**Android Developer Tools**_ and _**SQLite 3**_.
* Device with Google Authenticator must have _**root**_.


## HOW TO

Connect your device in _**USB debugging mode**_.

```
$ cd /tmp
$ adb root
$ adb pull /data/data/com.google.android.apps.authenticator2/databases/databases
$ sqlite3 ./databases "select * from accounts" > google_authenticator_backup.txt
$ rm ./databases
```

**If you look at the file, you see a pipe-delimited file with entries looking like the following.**
**The X's mark the key.**

1|Google:me@gmail.com|XXXXXXXXXXXXXXXXXXXXXXXX|0|0|0|| Google|Google:me@gmail.com  
2|Google:me@domain.org|XXXXXXXXXXXXXXXXXXXXXXXX|0|0|0|Google|Google:me@domain.org  
3|Dropbox:me@gmail.com|XXXXXXXXXXXXXXXXXXXXXXXX|0|0|0|Dropbox|Dropbox:me@gmail.com  


To restore the keys, you can key them in manually in Google Authenticator:  
Menu -> Set up account -> Enter provided key.  
Enter the key exactly as it appears, case sensitive, and choose Time-based.

**Last tested December 18th 2016 on a Lenovo 4G (surnia) running Cyanogenmod 14.1 nightly, with Google Authenticator 4.74.**
