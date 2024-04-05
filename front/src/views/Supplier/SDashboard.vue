<template>
    <div>
      <STopHeader></STopHeader>
      <b-container class="mt-5">
        <b-row align-v="center">
          <b-col>
            <h3>Bienvenue {{ user.firstName }} {{ user.lastName }},</h3>
            <h5>Bienvenue sur le tableau de bord des fournisseurs</h5>
          </b-col>
        </b-row>
      </b-container>
      <div> 
        <iframe title="Report Section" width="1080" height="720" src="https://app.powerbi.com/view?r=eyJrIjoiNjA0ODZhNjAtM2NlNC00ZDNkLTg3MTctOGVkMDk0NTZmOGVkIiwidCI6ImRiZDY2NjRkLTRlYjktNDZlYi05OWQ4LTVjNDNiYTE1M2M2MSIsImMiOjl9" frameborder="0" allowFullScreen="true"></iframe>
      </div>
      <MyFooter class="mt-5" />
    
    </div>
  </template>
  
  <script>
  import STopHeader from "@/components/Supplier/STopHeader.vue";
  import MyFooter from "@/components/Common/MyFooter.vue";
  import * as pbi from "powerbi-client";
  export default {
    name: "AOverview",
    components: {
      STopHeader,
      MyFooter,
    },
    data() {
      return {
        user: this.$store.state.CurrentUser.user,
      };
    },
    mounted() {
      const permissions = pbi.models.Permissions.All
   const config = {
     type: 'dashboard',
     tokenType: pbi.models.TokenType.Embed,
     accessToken:"true",
     embedUrl: "https://app.powerbi.com/view?r=eyJrIjoiNjA0ODZhNjAtM2NlNC00ZDNkLTg3MTctOGVkMDk0NTZmOGVkIiwidCI6ImRiZDY2NjRkLTRlYjktNDZlYi05OWQ4LTVjNDNiYTE1M2M2MSIsImMiOjl9",
     id: "7a48d382-a0d0-4e09-b83f-16f615ef96d3",
     pageView: 'fitToWidth',
     permissions: permissions,
   };

   

   let powerbi = new pbi.service.Service(pbi.factories.hpmFactory, pbi.factories.wpmpFactory, pbi.factories.routerFactory);
   const dashboardContainer = document.getElementById('container');
   const dashboard = powerbi.embed(dashboardContainer, config);

   dashboard.off("loaded");
   dashboard.off("rendered");
   dashboard.on("error", function () {
     this.dashboard.off("error");
   });
  }
 };

  </script>
  
  <style lang="scss" scoped></style>
  