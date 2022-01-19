
buynow=function(name,price,id)
        {
          
         
          if( document.getElementById('qty') != null )
          {

            var orderableType = "ProductVariant";
            var quantity = document.getElementById('qty').value;
            var totalamount = document.getElementById('total_amount').value;
             
          }
          else
          {
            var quantity = 1;
            var orderableType = "ProductService";
            var startTime = $("#slot_start_time").val();
            var endTime = $("#slot_end_time").val();
            var duration = $("#duration").val();
            var date= $("#date").val();
           
          }
           
           $.ajax({ 
               url: "../checkout/create",
               type: "post",
               data: "name="+name+"&amount="+price+"&qty="+quantity+"&id="+id+"&orderable_type="+orderableType+"&start_time="+startTime+"&end_time="+endTime+"&duration"+duration+"&date="+date+"&total_amount="+totalamount,
               success: function (response)
               {

               }
                


           })
        }