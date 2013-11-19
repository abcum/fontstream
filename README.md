# fontstream

An AS3 library to handle progressive font loading. Avoid one time load of large swf font files by splitting each font into many font files and loading only what is required.

```as3
var loader:FontLoader = new FontLoader();
loader.load(new FontChunksRequest("Arial Unicode MS", FontStyle.REGULAR, "Some text"));
```

---

*This project is originally a clone of [https://code.google.com/p/fstream/](https://code.google.com/p/fstream/)*