// http://jsfiddle.net/mekwall/sgxKJ/

$.widget("ui.autocomplete", $.ui.autocomplete, {
    options : $.extend({}, this.options, {
        multiselect: false
    }),
    _create: function(){
        this._super();

        var self = this,
            o = self.options;

        if (o.multiselect) {
            console.log('multiselect true');

            self.selectedItems = {};  
            self.multiselect = $("<div></div>")
                .addClass("ui-autocomplete-multiselect ui-state-default ui-widget")
                //.css("width", self.element.width())
                .css("width", "100%")
                .insertBefore(self.element)
                .append(self.element)
                .bind("click.autocomplete", function(){
                    self.element.focus();
                });
            
            var fontSize = parseInt(self.element.css("fontSize"), 10);
            function autoSize(e){
                // Hackish autosizing
                var $this = $(this);
                $this.width(1).width(this.scrollWidth+fontSize-1);
            };

            var kc = $.ui.keyCode;
            self.element.bind({
                "keydown.autocomplete": function(e){
                    if ((this.value === "") && (e.keyCode == kc.BACKSPACE)) {
                        var prev = self.element.prev();
                        delete self.selectedItems[prev.text()];
                        prev.remove();
                    }
                },
                // TODO: Implement outline of container
                "focus.autocomplete blur.autocomplete": function(){
                    self.multiselect.toggleClass("ui-state-active");
                },
                "keypress.autocomplete change.autocomplete focus.autocomplete blur.autocomplete": autoSize
            }).trigger("change");

            // TODO: There's a better way?
            o.select = o.select || function(e, ui) {
                //$("<span></span>")
            	
            	//selectedMember.push(ui);
            	//console.log(selectedMember);
            	
                $("<div></div>")
                    .addClass("ui-autocomplete-multiselect-item selectedMember")
                    .text(ui.item.label)
                    .val(ui.item.value)
                    .append(
                        $("<div></div>")
                            .addClass("ui-icon ui-icon-close")
                            .click(function(){
                                var item = $(this).parent();
                                delete self.selectedItems[item.text()];
                                item.remove();
                            })
                    )
                    .insertBefore(self.element);

                self.selectedItems[ui.item.label] = ui.item;
                self._value("");
                
                return false;
            }
            
            /*self.options.open = function(e, ui) {
                var pos = self.multiselect.position();
                pos.top += self.multiselect.height();
                self.menu.element.position(pos);
            }*/
        }
        
        
        
    	//선택한 사용자의 user_no를 controller에 전달
        $("#inviteMember").click(function(){
          	var selectedMember = document.querySelectorAll(".selectedMember");
    		var memberInviteDiv = document.getElementById("memberInviteDiv");
          	
          	for(var i=0, len=selectedMember.length; i<len; i++){
    	      	var input = document.createElement("input");
    	      	/*input.type="hidden";
    	      	input.className = "member";*/
    	      	input.setAttribute('type', 'hidden');
    	      	input.setAttribute('name', 'member');
    	      	input.setAttribute('value', selectedMember[i].value);
    	      	//member[i].value = selectedMember[i].value;
    	      	
    	      	memberInviteDiv.appendChild(input);
            }
          	var member = document.getElementsByName("member");
          	for(var i=0, len=member.length; i<len; i++){
          		console.log(member[i]);
          	}
          	
           
          	//alert(document.getElementsByName("user_no2").value);
          	
          	
          	
          	
          	
                	
                	
        });
        
        return this;
    }
});