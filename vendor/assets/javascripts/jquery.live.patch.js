// https://gist.github.com/furf/330030
(function($) {
  
  /**
   * Add live and die to the jQuery root
   */
  $.extend({
    
    live: function( selector, type, data, fn, thisObject ) {

      if ( jQuery.isFunction( data ) ) {
        if ( fn !== undefined ) {
          thisObject = fn;
        }
        fn = data;
        data = undefined;
      }
      // this.context || document handles instance and root usage
      jQuery( this.context || document ).bind( liveConvert( type, selector ), {
        data: data, selector: selector, live: type
      }, fn, thisObject );
      return this;
    },
    
    die: function( selector, type, fn ) {
      // this.context || document handles instance and root usage
  		jQuery( this.context || document ).unbind( liveConvert( type, selector ), fn ? { guid: fn.guid + selector + type } : null );
  		return this;
  	}
  	
  });
  
  /**
   * Replace plugin live and die with aliased methods
   */
  $.fn.extend({
    
    live: function( type, data, fn, thisObject ) {
      return jQuery.live.call( this, this.selector, type, data, fn, thisObject );
    },
    
    die: function( type, fn ) {
      return jQuery.die.call( this, this.selector, type, fn );
    }
    
  });
  
  // Borrowed from closure for patch
  function liveConvert( type, selector ) {
  	return ["live", type, selector.replace(/\./g, "`").replace(/ /g, "|")].join(".");
  }

})(jQuery);
