<template>
  <b-navbar type="is-primary" wrapper-class="container">
    <template #brand>
      <b-navbar-item tag="router-link" :to="{ path: '/' }">
        <a href="#" class="has-text-weight-bold is-size-5 has-text-white">
          Helm Charts
        </a>
      </b-navbar-item>
    </template>
    <template #start></template>

    <template #end>
      <b-navbar-item tag="div">
        <div class="buttons">
          <b-button type="is-primary" icon-left="github">
            <span>GitHub</span>
          </b-button>
        </div>
      </b-navbar-item>
    </template>
  </b-navbar>
</template>
<script lang="ts">
import { defineComponent } from "@vue/composition-api";

export default defineComponent({
  name: "Navbar"
});
</script>
