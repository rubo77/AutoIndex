<!-- http://photoswipe.com/documentation/getting-started.html -->

<figure itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject">
  {file:if:is_real_dir}<a class="folderlink" href="{file:link}" onclick="window.location='{file:link}'">{file:filename}</a> ({file:num_subfiles}&nbsp;Bilder){end if}
  {file:if:is_parent_dir}<a class="folderlink back-link" href="{file:link}" onclick="window.location='{file:link}'">&nbsp; &larr; &nbsp;</a>{end if}
  {file:if:is_file}
    <a itemprop="contentUrl" data-size="{file:width}x{file:height}" href="{file:link}">
      {file:thumbnail}
    </a>
    {if:description_file}
      <figcaption itemprop="caption description">
          {file:filename}
      </figcaption>
    {end if:description_file}
  {end if}
</figure>
