<script lang="ts">
  import { onMount } from 'svelte';
  import PromptForm from '$lib/PromptForm.svelte';
  import SavedPrompts from '$lib/SavedPrompts.svelte';

  let savedPrompts: Array<{
    scene: string;
    subject: string;
    setting: string;
    style: string;
  }> = [];

  onMount(() => {
    const storedPrompts = localStorage.getItem('midjourney_prompts');
    if (storedPrompts) {
      savedPrompts = JSON.parse(storedPrompts);
    }
  });

  function savePrompt(prompt: { scene: string; subject: string; setting: string; style: string }) {
    savedPrompts = [...savedPrompts, prompt];
    localStorage.setItem('midjourney_prompts', JSON.stringify(savedPrompts));
  }

  function deletePrompt(index: number) {
    savedPrompts = savedPrompts.filter((_, i) => i !== index);
    localStorage.setItem('midjourney_prompts', JSON.stringify(savedPrompts));
  }

  async function copyToClipboard(text: string) {
    try {
      await navigator.clipboard.writeText(text);
    } catch (err) {
      console.error('Failed to copy text: ', err);
    }
  }
</script>

<svelte:head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
</svelte:head>

<main>
  <h1>Midjourney Prompt Creator</h1>
  
  <PromptForm onSave={savePrompt} />

  <SavedPrompts
    {savedPrompts}
    onDelete={deletePrompt}
    onCopy={copyToClipboard}
  />
</main>

<style>
  :global(body) {
    background-color: #1e1e1e;
    color: #e0e0e0;
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
  }

  main {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
  }

  h1 {
    color: #bb86fc;
    text-align: center;
  }

  @media (max-width: 600px) {
    main {
      padding: 10px;
    }
  }
</style>