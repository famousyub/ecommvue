<template>
    <div>
      <b-container>
        <b-row>
          <b-col>
            <hr />
            <b-row class="my-5" id="customer-support" align-v="center">
              <b-col class="text-center">
                <b-card>
                  <b-img
                    height="125"
                    src="http://localhost:8084/public/display-icons/fast-delivery-icon.png"
                  />
                  <br />
                  <h5 class="mt-1">
                    <a style="text-decoration: none; color: #000;" href="#customer-support"
                      >Livraison rapide <br> Du supermarché à votre porte.</a
                    >
                  </h5>
                </b-card>
              </b-col>
  
              
  
              <b-col class="text-center">
                <b-card>
                  <b-img
                    height="125"
                    src="http://localhost:8084/public/display-icons/online-support-icon.png"
                  />
                  <br />
                  <h5 class="mt-1">
                    <a style="text-decoration: none;color: #000; "  href="#customer-support"
                      >Support 24 Hours <br>
                      A satisfied customer is our purpose.</a
                    >
                  </h5>
                </b-card>
              </b-col>
            </b-row>
            <hr />
           
          </b-col>
        </b-row>
      </b-container>
    </div>
  </template>
  
  <script>
  export default {
    name: "Support",
    components: {},
    data() {
      return {};
    },
    mounted() {},
    methods: {},
    computed: {},
  };
  </script>
  
  <style lang="scss" scoped></style>
  