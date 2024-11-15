# FileIntegrityMonitor

<h2>Description</h2>
In this lab, I created a File Integrity Monitor (FIM) and used it to create and monitor a baseline.  I created a hash of a list of text files with SHA-512 and ran tests to see what would happen if the files were modified, deleted, or if another one was added.  If something deviated from the baseline, an alert would be sent out.
<br />


<h2>Languages and Utilities Used</h2>

- <b>PowerShell</b> 
- <b>SHA-512</b>

<h2>Environments Used </h2>

- <b>Windows 10</b>

<h2>Program walk-through:</h2>

<p align="center">
1. Run the program <br/>
<img src="![image](https://github.com/user-attachments/assets/b300a310-6841-4cb6-9ebd-7b366df00a6f)" height="80%" width="80%" alt="File Integrity Monitor Steps"/>
<br />
<br />
2. Type "A" to create a baseline  <br/>
<img src="https://imgur.com/NtIIWdY" height="80%" width="80%" alt="File Integrity Monitor Steps"/>
<br />
<br />
3. View the baseline.txt file in your folder to see if all of the files are there.  In this example, I added an extra file, e.txt. <br/>
<img src="https://imgur.com/ByyCSWl" height="80%" width="80%" alt="File Integrity Monitor Steps"/>
<br />
<br />
4. Create another file in the Files folder and run it, pressing B to monitor any changes.  The program will alert that a new file, f.txt in this case, has been created.  Delete the file or create a baseline after.  <br/>
<img src="https://imgur.com/urK3U87" height="80%" width="80%" alt="File Integrity Monitor Steps"/>
<br />
<br />
5. Modify one of the existing files.  In this case, I added a B character to the end of a.txt, which will change the file's hash value.  <br/>
<img src="https://imgur.com/NVL532P" height="80%" width="80%" alt="File Integrity Monitor Steps"/>
<br />
<br />
6. Monitor changes again.  You will be alerted that the following file has been changed.  Change the file back or update the baseline to remove the alert.  <br/>
<img src="https://imgur.com/VhmXZ99" height="80%" width="80%" alt="File Integrity Monitor Steps"/>
<br />
<br />
7. Delete one of the files.  In this case, I chose e.txt since I created it beforehand.  Run and monitor again, and you will see an alert that says that the file has been deleted.  <br/>
<img src="https://imgur.com/F8CYIwT" height="80%" width="80%" alt="File Integrity Monitor Steps"/>
<br />
<br />
8. Run the file again and update the baseline again to restore it back to it's original state.  <br/>
<img src="https://imgur.com/qW2fsuW" height="80%" width="80%" alt="File Integrity Monitor Steps"/>
<br />
<br />
9. You will see that there are now only 4 files in the baseline.  <br/>
<img src="https://imgur.com/4Gm4JQA" height="80%" width="80%" alt="File Integrity Monitor Steps"/>
</p>

<!--
 ```diff
- text in red
+ text in green
! text in orange
# text in gray
@@ text in purple (and bold)@@
```
--!>
