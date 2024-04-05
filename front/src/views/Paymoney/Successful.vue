<template>
    <div>
      <TopHeader></TopHeader>
      <b-container class="mt-5">
        <b-row align-h="center">
          <b-col cols="6" class="text-center">
            <b-card
              border-variant="primary"
              header="Succeeded"
              header-bg-variant="primary"
              header-text-variant="white"
              align="center"
            >
              <b-button size="lg" disabled variant="primary">
                <b-icon icon="check" scale="3" />
              </b-button>
              <h1 class="mt-4">Vous êtes prêt !</h1>
              <h6>Merci pour votre achat!</h6>
              <h6>Nous livrerons votre commande en quelques minutes.</h6>
              <b-card-footer class="mt-4"> EShopping </b-card-footer>
            </b-card>
          </b-col>
        </b-row>
      </b-container>
      <MyFooter class="mt-5" />
    </div>
  </template>
  
  <script>
  import TopHeader from "@/components/Common/TopHeader.vue";
  import MyFooter from "@/components/Common/MyFooter.vue";
  import OrderService from "@/services/OrderService.js";
  import OrderItemService from "@/services/OrderItemService.js";
 
  export default {
    name: "Successful",
    components: {
      TopHeader,
      MyFooter,
    },
    data() {
      return {
        order: {},
        session: {},
        validSession: false,
        name:null,
        email:null,
        address:null,
        status:null,
        variant:null,
        checkoutSessionId:null,
        productCost:null,
        currency:"TND",
        shippingCost:null,
      };
    },
    computed: {},
     mounted() {},
    methods: {

      
        async newOrder(req , res){
          try { 
          const order = ( await OrderService.createOrder({
            name: req.body.customerName,
            email: req.body.customerEmail,
            phoneNo: req.body.customerPhoneNo,
            address: req.body.shippingAddress,
            status: "en cours",
            variant: "dark",
            checkoutSessionId: 25,
            productCost: req.body.totalAmount ,
            currency :"TND",
            shippingCost: req.body.shipping ,

          })  
        ).data;
        res(order);
            console.log(order);
          

 
      } catch (error) {
        console.log(error.response.data.error);
      }
        
      try {
        for (let i = 0; i < this.checkoutProduct.length; i++) {
        const orderitem =(await OrderItemService.createOrderItem({
            quantity: this.checkoutProduct[i].quantity,
            ProductId : this.checkoutProduct[i].productId,
            OrderId : this.order.id,
        })).data; 
        console.log(orderitem);
      }
      
      }catch (error) {
        console.log(error.response.data.error);
      }
      

    }}
   
  };
  </script>
  
  <style lang="scss" scoped></style>
  