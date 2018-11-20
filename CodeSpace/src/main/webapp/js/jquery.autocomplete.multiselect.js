// http://jsfiddle.net/mekwall/sgxKJ/

$.widget("ui.autocomplete", $.ui.autocomplete, {
    options : $.extend({}, this.options, {
        multiselect: false
    }),
    _create: function(){
        this._super();

        var self = this,
            o = self.options;
        // 선택된 사용자 정보 저장하는 변수
        //var selectedMember = [];

        	//this.options.multiselect
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
            
            
            
            
            //project member 초대하기 버튼 클릭 시 이벤트
            $("#inviteMember").click(function(){
            	var selectedUserNo = [];
            	var selectedMember = document.querySelectorAll(".selectedMember");

            	for(var i=0, len=selectedMember.length; i<len; i++){
            		selectedUserNo[i] = selectedMember[i].value;
            	}
            	
            	
            	/*$.post("/cos/project/inviteMember", function(selectedMember){
            		alert(selectedMember);
            	});*/
            	
            	
            });
        }
        
      //  console.log(self.selectedItems);
        

        return this;
    }
});