using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Kona.Model
{
    
    /// <summary>
    /// A class which represents a URL-based image
    /// </summary>
    public class Image {
        string _thumb;
        string ThumbnailPhoto
        {
            get
            {
                return _thumb;
            }
        }
        string _full;
        string FullSizePhoto
        {
            get {
                return _full;
            }
        }

        bool _isDefault;
        bool IsDefault {
            get {
                return _isDefault;
            }
        }

        public Image(string thumb, string full) : this(thumb, full, false) { }
        public Image(string thumb, string full, bool isDefault) {
            _thumb = thumb;
            _isDefault = isDefault;
            _full = full;
        }

    }

 }
