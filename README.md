# RayConvert

RayConvert is a Windows desktop file converter written in Python with a restrained OLED-dark interface. Select files, choose a target format and output folder, then click **Convert**. The app produces actual files in the selected format rather than changing their extensions.

Image conversion uses Pillow, PDF conversion uses PyMuPDF, document conversion uses python-docx and ReportLab, and audio/video conversion uses the FFmpeg binary bundled with imageio-ffmpeg. No Microsoft Word, LibreOffice, or internet connection is required to run the bundled app.

## Quick start

The bundled release requires Python 3.12. Double-click **RayConvert.cmd**, or run:

    python rayconvert.py

The local release includes its dependencies in the vendor folder. For a source checkout from GitHub:

    python -m pip install -e .
    python rayconvert.py

Command-line conversion is also available:

    python rayconvert.py --convert "photo.png" --to webp --output-dir "converted"

## Supported conversions

| Input | Output |
| --- | --- |
| JPG/JPEG, PNG, WebP, BMP, TIFF/TIF, GIF | JPG, PNG, WebP, BMP, TIFF, GIF, PDF |
| PDF | One PNG/JPG per page, TXT, DOCX |
| DOCX, TXT, HTML | PDF, DOCX, TXT, HTML |
| MP4, MOV, MKV, AVI, WebM | MP4, MOV, MKV, AVI, WebM, MP3, WAV, FLAC, OGG, M4A |
| MP3, WAV, FLAC, OGG, M4A | MP3, WAV, FLAC, OGG, M4A |

The source format is not offered as a target. When several files are selected, the UI offers only formats supported by all of them.

## File safety and limitations

- Source files are read but never deleted or overwritten by RayConvert.
- Conversion happens in a temporary directory inside the selected output folder.
- Image, PDF, and Word outputs are reopened for validation. Audio and video outputs are decoded from beginning to end with FFmpeg.
- Failed validation removes the temporary output and reports an error.
- Existing files are never overwritten. A numbered filename is used when needed.
- Every page of a multipage PDF is validated before any page is published.

**Changing formats can lose quality or layout.** JPG, GIF, and many audio/video encodings are lossy. DOCX/TXT/HTML conversions cannot reproduce complex page layouts exactly. DOCX to PDF transfers text and common embedded raster images, placing images in an appendix; unsupported images cause an error. PDF to DOCX includes a picture of every page and adds selectable text when available. Scanned PDF to TXT requires OCR, which this app does not provide, so the operation fails rather than creating an empty text file. Animated GIFs and multipage TIFFs use only the first frame for image targets; all frames are included when the target is PDF. The source file always remains in place.

## Install from this repository

    python -m pip install -e .
    python rayconvert.py

The vendor folder is excluded from GitHub. The dependencies are installed by pip.

## License

Copyright 2026 YASEDEM. RayConvert application code is licensed under the **PolyForm Noncommercial License 1.0.0**. Read [LICENSE](LICENSE) and [NOTICE](NOTICE) before using or redistributing it. Third-party libraries and the bundled FFmpeg binary remain under their respective licenses.


