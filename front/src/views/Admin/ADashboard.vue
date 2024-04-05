<template>
    <div>
      <ATopHeader></ATopHeader>
      <b-container class="mt-5">
      <b-row align-v="center">
        <b-col>
          <h3>Bienvenue {{ user.firstName }} {{ user.lastName }},</h3>
          <h5>Bienvenue sur le tableau de bord d'administrateur'</h5>
        </b-col>
       
      </b-row>
    </b-container>
    <div>
      <iframe  position="center" title="Report Section" width="1080" height="1060" src="https://app.powerbi.com/view?r=eyJrIjoiN2EyODZkMjgtNzVjNS00MGVhLTlmYTAtMWFlMTQ1M2IwNjNlIiwidCI6ImRiZDY2NjRkLTRlYjktNDZlYi05OWQ4LTVjNDNiYTE1M2M2MSIsImMiOjl9" frameborder="0" allowFullScreen="true"></iframe>
    </div>
      <MyFooter class="mt-5" />
    </div>
  </template>
  
  <script>
  import ATopHeader from "@/components/Admins/ATopHeader.vue";
  import MyFooter from "@/components/Common/MyFooter.vue";
  import * as pbi from "powerbi-client";

  export default {
    name: "AOverview",
    components: {
      ATopHeader,
      MyFooter,
   
    },
    data() {
      return {
         user: this.$store.state.CurrentUser.user,
          
      };
    },
    mounted () {
   const permissions = pbi.models.Permissions.All
   const config = {
     type: 'dashboard',
     tokenType: pbi.models.TokenType.Embed,
     accessToken:"true",
     embedUrl: "https://app.powerbi.com/view?r=eyJrIjoiN2EyODZkMjgtNzVjNS00MGVhLTlmYTAtMWFlMTQ1M2IwNjNlIiwidCI6ImRiZDY2NjRkLTRlYjktNDZlYi05OWQ4LTVjNDNiYTE1M2M2MSIsImMiOjl9",
     id: "603104f7-5845-4adc-9536-5c972fc0ba67",
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
  