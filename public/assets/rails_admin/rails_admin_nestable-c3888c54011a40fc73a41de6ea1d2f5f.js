(function(){jQuery(function(){var a,b,c;return a=$("#tree_nodes"),c={},b=a.data("max-depth"),b&&b!=="false"&&(c.maxDepth=b),a.nestable(c).on({change:function(b){var c;return c=a.nestable("serialize"),$.ajax({url:a.data("update-path"),type:"POST",data:{tree_nodes:c},success:function(a){var b;return b=$("<div>").addClass("nestable-flash alert").append($("<button>").addClass("close").data("dismiss","alert").html("&times;")).append($("<span>").addClass("body").html(a)),$("#rails_admin_nestable").append(b),b.fadeIn(200).delay(2e3).fadeOut(200,function(){return $(this).remove()})}})}})})}).call(this);