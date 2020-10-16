<template>
    <v-overlay :value="loading">
      <v-progress-circular
      v-if="loading"
      :size="size || 70"
      :width="width || 7"
      :color="color || 'amber'"
      indeterminate
      />
    </v-overlay>
</template>

<script>
export default {
  name: "OverlayProgressIcon",
  props: ["loading", "color", "size", "width"]
};
</script>