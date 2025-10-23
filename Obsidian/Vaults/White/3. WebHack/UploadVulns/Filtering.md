## Filtering
​
Just filters; lets ronk:
​
​
### Extension Validation
​
They either _blacklist_ extensions (i.e. have a list of extensions which are **not** allowed) or they _whitelist_ extensions (i.e. have a list of extensions which are allowed, and reject everything else).
​
- #### Bypass EV
  ​
  1. ##### Client Side bp:
     ​
     - Upload a file with a valid extension (like .jpg or whatever)
       ​
       Intercep the request with BurpSuite (dont forget to delete the ==^js$|== in the Option's Intercept Client Requests tab)
       ​
       
       ![[Pasted image 20221229133251.png]]
       
       ​
       Change the extension (the first red square)
       ​
       
       ![[Pasted image 20221229133402.png]]
       
       ​
       Send
       
       ​
  2. ##### Server Side bp:
     ​
     - Try variations - fe. if you want to upload a *.php* try a *==.php5==*
       ​​
     - Try chains of extensions - fe. for same as last, try a *==.jpg.php==*
       ​
       
​​
### File Type Filtering
​
Similar to Extension validation, but more intensive, file type filtering looks, once again, to verify that the contents of a file are acceptable to upload. We'll be looking at two types of file type validation.
​
- #### Bypass FTF
  ​
  1. ##### Client Side bp (MIME validation):
     ​
     - MIME (Multipurpose Internet Mail Extension) types are used as an identifier for files -- originally when transfered as attachments over email, but now also when files are being transferred over HTTP(S). The MIME type for a file upload is attached in the header of the request, and looks something like this:
       ​
       
       ![[Pasted image 20230315043057.png]]
       
       ​
       Upload a file with a valid extension (like .jpg or whatever)
       ​
       Intercep the request with BurpSuite (dont forget to delete the ==^js$|== in the Option's Intercept Client Requests tab)
       ​
       
       ![[Pasted image 20221229133251.png]]
       
       ​
       Change the Content-Type (the second red square)
       ​
       
       ![[Pasted image 20221229133402.png]]
       
       ​
       Send
       
       ​
  2. ##### Server Side bp (Magic Number):
     ​
     - Magic numbers are the more accurate way of determining the contents of a file; although, they are by no means impossible to fake. The "magic number" of a file is a string of bytes at the very beginning of the file content which identify the content.
       ​
       
       ![[Pasted image 20230315045636.png]]
       
       ​
       List of Magic Numbers: https://en.wikipedia.org/wiki/List_of_file_signatures
       ​
       Pick the Magic Number that you need, that you want, that you feel
       ​
       Nano it (i mean edit the file you want to upload). Put a number of characters in the first line as number of bytes has the Magic Number you chose. Save it!
       ​
       
       ![[Pasted image 20230315051340.png]]
       
       ​
       Open it in a Hex-editor. Linux have ==hexeditor==
       ​
       Edit the amount of characters by replacing them with the bytes of your chosen Magic Number (in the HEX-CODE section). Save it!
       ​
       
       ![[Pasted image 20230315051841.png]]
       
       ![[Pasted image 20230315051856.png]]
       
       ​
       Send
       ​
       
​
### File Length Filtering
​
File length filters are used to prevent huge files from being uploaded to the server via an upload form (as this can potentially starve the server of resources). In most cases this will not cause us any issues when we upload shells; however, it's worth bearing in mind that if an upload form only expects a very small file to be uploaded, there may be a length filter in place to ensure that the file length requirement is adhered to. As an example, our fully fledged PHP reverse shell from the previous task is 5.4Kb big -- relatively tiny, but if the form expects a maximum of 2Kb then we would need to find an alternative shell to upload.
​
​
### File Name Filtering
​
As touched upon previously, files uploaded to a server should be unique. Usually this would mean adding a random aspect to the file name, however, an alternative strategy would be to check if a file with the same name already exists on the server, and give the user an error if so. Additionally, file names should be sanitised on upload to ensure that they don't contain any "bad characters", which could potentially cause problems on the file system when uploaded (e.g. null bytes or forward slashes on Linux, as well as control characters such as ; and potentially unicode characters). What this means for us is that, on a well administered system, our uploaded files are unlikely to have the same name we gave them before uploading, so be aware that you may have to go hunting for your shell in the event that you manage to bypass the content filtering.
​
​
### File Content Filtering
​
More complicated filtering systems may scan the full contents of an uploaded file to ensure that it's not spoofing its extension, MIME type and Magic Number. This is a significantly more complex process than the majority of basic filtration systems employ, and thus will not be covered in this room.