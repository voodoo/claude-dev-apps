<script lang="ts">
  export let savedPrompts: Array<{
    scene: string;
    subject: string;
    setting: string;
    style: string;
  }>;
  export let onDelete: (index: number) => void;
  export let onCopy: (text: string, index: number) => void;

  let copiedIndex: number | null = null;

  function generateFullPrompt(p: { scene: string; subject: string; setting: string; style: string }): string {
    return `${p.scene} ${p.subject} ${p.setting} ${p.style}`.trim();
  }

  function handleCopy(prompt: { scene: string; subject: string; setting: string; style: string }, index: number) {
    const fullPrompt = generateFullPrompt(prompt);
    onCopy(fullPrompt, index);
    copiedIndex = index;
    setTimeout(() => {
      copiedIndex = null;
    }, 2000);
  }
</script>

<h2>Saved Prompts</h2>
{#if savedPrompts.length > 0}
  <ul>
    {#each savedPrompts as savedPrompt, index}
      <li>
        <div class="prompt-content">
          <strong>Scene:</strong> {savedPrompt.scene}
          <br>
          <strong>Subject:</strong> {savedPrompt.subject}
          <br>
          <strong>Setting:</strong> {savedPrompt.setting}
          <br>
          <strong>Style:</strong> {savedPrompt.style}
        </div>
        <div class="button-group">
          <button class="action-button" on:click={() => handleCopy(savedPrompt, index)}>
            {copiedIndex === index ? 'Copied!' : 'Copy'}
          </button>
          <button class="action-button delete-button" on:click={() => onDelete(index)}>Delete</button>
        </div>
      </li>
    {/each}
  </ul>
{:else}
  <p>No saved prompts yet.</p>
{/if}

<style>
  h2 {
    font-size: 24px;
    color: #bb86fc;
    margin-bottom: 20px;
  }

  ul {
    list-style-type: none;
    padding: 0;
  }

  li {
    margin-bottom: 20px;
    padding: 20px;
    background-color: #2c2c2c;
    border-radius: 8px;
    display: flex;
    flex-direction: column;
    gap: 15px;
  }

  .prompt-content {
    font-size: 16px;
    line-height: 1.5;
  }

  .button-group {
    display: flex;
    gap: 10px;
    justify-content: flex-end;
  }

  .action-button {
    padding: 10px 20px;
    font-size: 16px;
    background-color: #bb86fc;
    color: #1e1e1e;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.3s;
  }

  .action-button:hover {
    background-color: #a174e0;
  }

  .delete-button {
    background-color: #cf6679;
  }

  .delete-button:hover {
    background-color: #b55465;
  }

  @media (max-width: 600px) {
    li {
      padding: 15px;
    }

    .button-group {
      flex-direction: column;
    }

    .action-button {
      width: 100%;
    }
  }
</style>