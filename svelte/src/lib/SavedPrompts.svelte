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
    let parts = [
      `Scene: ${p.scene}`,
      `Subject: ${p.subject}`
    ];
    if (p.setting) parts.push(`Setting: ${p.setting}`);
    if (p.style) parts.push(`Style: ${p.style}`);
    return parts.join(' | ');
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
          <p><strong>Scene:</strong> {savedPrompt.scene}</p>
          <p><strong>Subject:</strong> {savedPrompt.subject}</p>
          {#if savedPrompt.setting}
            <p><strong>Setting:</strong> {savedPrompt.setting}</p>
          {/if}
          {#if savedPrompt.style}
            <p><strong>Style:</strong> {savedPrompt.style}</p>
          {/if}
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
  ul {
    list-style-type: none;
    padding: 0;
  }

  li {
    margin-bottom: 20px;
    padding: 20px;
    background-color: #1a1a1a;
    border-radius: 8px;
    display: flex;
    flex-direction: column;
    gap: 15px;
  }

  .prompt-content {
    font-size: 16px;
    line-height: 1.5;
    color: #e0e0e0;
  }

  .prompt-content p {
    margin: 5px 0;
  }

  .button-group {
    display: flex;
    gap: 10px;
    justify-content: flex-end;
  }

  .action-button {
    padding: 10px 20px;
    font-size: 16px;
    background-color: #3a3a3a;
    color: #e0e0e0;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.3s;
  }

  .action-button:hover {
    background-color: #4a4a4a;
  }

  .delete-button {
    background-color: #2a2a2a;
  }

  .delete-button:hover {
    background-color: #3a3a3a;
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