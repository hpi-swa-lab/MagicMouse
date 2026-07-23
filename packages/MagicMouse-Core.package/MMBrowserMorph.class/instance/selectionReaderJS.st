javascript
selectionReaderJS
	"JS that returns the current selection as a String, piercing open shadow
	roots. window.getSelection() cannot see into shadow DOM, but Chrome exposes
	the non-standard shadowRoot.getSelection(). We check the document and every
	open shadow root (breadth-first) and return the first non-empty selection."

	^ '(function(){
  function selOf(root){
    try { var s = root.getSelection ? root.getSelection() : null;
          return s ? s.toString() : ""; } catch(e){ return ""; }
  }
  var top = selOf(document);
  if (top) return top;
  var queue = [document];
  while (queue.length){
    var node = queue.shift();
    var els = node.querySelectorAll ? node.querySelectorAll("*") : [];
    for (var i=0;i<els.length;i++){
      var sr = els[i].shadowRoot;
      if (sr){
        var s = selOf(sr);
        if (s) return s;
        queue.push(sr);
      }
    }
  }
  return "";
})()'