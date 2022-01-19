addtowishlist=function(productvariantid,userId,urlpath)
{
    
    $.ajax({
        url: urlpath,
        type: "get",
        data: "product_variant_id="+productvariantid+"&user_id="+userId,
        success: function (response)
        {           
             window.location.reload();
        }
    
    })
}

removefromwishlist=function (productvariantid,userId,urlpath)
{
    $.ajax({

        url: urlpath,
        type: "get",
        data: "product_variant_id="+productvariantid+"&user_id="+userId,
        success: function (response)
        {
         
            window.location.reload();
        }
    })
}