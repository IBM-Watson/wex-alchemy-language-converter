# Watson Explorer Engine Converter: AlchemyLanguage Converter
AlchemyAPI offers 12 API functions as part of its text analysis service, each of which uses sophisticated natural language processing techniques to analyze your content and add high-level semantic information. These functions are accessed via a REST API, and the data is returned as an easy-to-parse structure. An API key required to use the AlchemyLanguage service and can be acquired from the Alchemy API wesbsite (http://www.alchemyapi.com/api/register.html).

 See the AlchemyLanguage API Reference for examples and detailed information on each AlchemyLanguage function (http://www.alchemyapi.com/products/alchemylanguage).

## Global

Name | Description | Default Value | Required?
---|---|---|:---:
AlchemyAPI base URL | REST endpoints for all API requests will be built from this starting point. | https://access.alchemyapi.com/ | 
AlchemyAPI API Key | This is the key, provided to your organization by AlchemyAPI, an IBM company, that grants access to the AlchemyAPI services. A key can be obtained from http://www.alchemyapi.com/api/register.html |  | Yes
Default timeout | This sets the default amount of time, in seconds, to wait for a response from the API call. This value can be overridden for individual services in their specific configuration. | 60 | 
Proxy server (host:port) | This sets a proxy server through which all AlchemyAPI calls will be directed. It is recommended that a local caching proxy be used to improve performance and reduce the total number of AlchemyAPI calls. |  | 
Proxy username and password | Provide the credentials used to authenticate to the proxy server configured above. |  | 
Enable debug contents | If debug contents are enabled, then when any enabled AlchemyAPI service returns an error, content containing the error message will be added to the document. This is useful for debugging, but it may not be as valuable in your final crawl. |  | 


## Sentiment Analysis

Name | Description | Default Value | Required?
---|---|---|:---:
Enable | Setting this to true will enable extracting positive/negative sentiment from any textual content. |  | 
Sentiment Analysis URL Path | This string will be concatenated to the end of the AlchemyAPI base URL configured above to generate the URL that points at the Sentiment Analysis service. | calls/text/TextGetTextSentiment | 
Sentiment Analysis contents | Provide a newline-separated list of the names of contents whose text will be submitted for Sentiment Analysis. Note that the Alchemy text APIs only consider the first 50kB of text, so text beyond the first 50kB will be trimmed before the API request is sent. | snippet
 | 
Sentiment Analysis Timeout | This sets the default amount of time, in seconds, to wait for a response from the Sentiment Analysis API call. A value of 0 indicates that the global AlchemyLanguage timeout setting should be used. | 0 | 


## Targeted Sentiment

Name | Description | Default Value | Required?
---|---|---|:---:
Enable | Setting this to true will enable extracting positive/negative sentiment targeted at a specified phrase from any textual content. |  | 
Targeted Sentiment URL Path | This string will be concatenated to the end of the AlchemyAPI base URL configured above to generate the URL that points at the Targeted Sentiment service. | calls/text/TextGetTargetedSentiment | 
Targeted Sentiment Target XPath | This XPath selects the text representing the target that is submitted to the Targeted Sentiment service. The target should appear in the text selected in the following option. | normalize-space(content[@name='author']/text()) | 
Targeted Sentiment Text contents | Provide a newline-separated list of the names of contents whose text will be submitted for Targeted Sentiment Analysis. Note that the Alchemy text APIs only consider the first 50kB of text, so text beyond the first 50kB will be trimmed before the API request is sent. | snippet
 | 
Targeted Sentiment Timeout | This sets the default amount of time, in seconds, to wait for a response from the Targeted Sentiment API call. A value of 0 indicates that the global AlchemyLanguage timeout setting should be used. | 0 | 


## Taxonomy

Name | Description | Default Value | Required?
---|---|---|:---:
Enable | Setting this to true will enable taxonomy classification of the selected text. See the [AlchemyAPI Taxonomy documentation](http://www.alchemyapi.com/api/taxonomy) for the complete list of possible categories. |  | 
Taxonomy URL Path | This string will be concatenated to the end of the AlchemyAPI base URL configured above to generate the URL that points at the Taxonomy service. | calls/text/TextGetRankedTaxonomy | 
Taxonomy contents | Provide a newline-separated list of the names of contents whose text will be submitted for Taxonomy Analysis. Note that the Alchemy text APIs only consider the first 50kB of text, so text beyond the first 50kB will be trimmed before the API request is sent. | snippet
 | 
Taxonomy Timeout | This sets the default amount of time, in seconds, to wait for a response from the Taxonomy API call. A value of 0 indicates that the global AlchemyLanguage timeout setting should be used. | 0 | 


## Concept Tagging

Name | Description | Default Value | Required?
---|---|---|:---:
Enable | Setting this to true will enable Concept Tagging, which discovers abstract concepts in the selected text. |  | 
Concept Tagging URL Path | This string will be concatenated to the end of the AlchemyAPI base URL configured above to generate the URL that points at the Concept Tagging service. | calls/text/TextGetRankedConcepts | 
Concept Tagging contents | Provide a newline-separated list of the names of contents whose text will be submitted for Concept Tagging. Note that the Alchemy text APIs only consider the first 50kB of text, so text beyond the first 50kB will be trimmed before the API request is sent. | snippet
 | 
Concept Tagging Timeout | This sets the default amount of time, in seconds, to wait for a response from the Concept Tagging API call. A value of 0 indicates that the global AlchemyLanguage timeout setting should be used. | 0 | 


## Entity Extraction

Name | Description | Default Value | Required?
---|---|---|:---:
Enable | Setting this to true will enable discovery and extraction of entities from any textual content. |  | 
Entity Extraction URL Path | This string will be concatenated to the end of the AlchemyAPI base URL configured above to generate the URL that points at the Entity Extraction service. | calls/text/TextGetRankedNamedEntities | 
Entity Extraction contents | Provide a newline-separated list of the names of contents whose text will be submitted for Entity Extraction. Note that the Alchemy text APIs only consider the first 50kB of text, so text beyond the first 50kB will be trimmed before the API request is sent. | snippet
 | 
Maximum Entities | This sets the maximum number of entities to extract. Entities in the text that might be found beyond this limit will not be returned. | 10 | 
Entity Extraction Timeout | This sets the default amount of time, in seconds, to wait for a response from the Entity Extraction API call. A value of 0 indicates that the global AlchemyLanguage timeout setting should be used. | 0 | 


## Keyword Extraction

Name | Description | Default Value | Required?
---|---|---|:---:
Enable | Setting this to true will enable discovery and extraction of topic keywords from any textual content. |  | 
Keyword Extraction URL Path | This string will be concatenated to the end of the AlchemyAPI base URL configured above to generate the URL that points at the Keyword Extraction service. | calls/text/TextGetRankedKeywords | 
Keyword Extraction contents | Provide a newline-separated list of the names of contents whose text will be submitted for Keyword Extraction. Note that the Alchemy text APIs only consider the first 50kB of text, so text beyond the first 50kB will be trimmed before the API request is sent. | snippet
 | 
Maximum Keywords | This sets the maximum number of keywords to extract. Keywords in the text that might be found beyond this limit will not be returned. | 10 | 
Keyword Extraction Timeout | This sets the default amount of time, in seconds, to wait for a response from the Keyword Extraction API call. A value of 0 indicates that the global AlchemyLanguage timeout setting should be used. | 0 | 


## Relation Extraction

Name | Description | Default Value | Required?
---|---|---|:---:
Enable | Setting this to true will enable discovery and extraction of Subject-Action-Object relations from any textual content. |  | 
Relation Extraction URL Path | This string will be concatenated to the end of the AlchemyAPI base URL configured above to generate the URL that points at the Relation Extraction service. | calls/text/TextGetRelations | 
Relation Extraction contents | Provide a newline-separated list of the names of contents whose text will be submitted for Relation Extraction. Note that the Alchemy text APIs only consider the first 50kB of text, so text beyond the first 50kB will be trimmed before the API request is sent. | snippet
 | 
Maximum Relations | This sets the maximum number of relations to extract. Relations in the text that might be found beyond this limit will not be returned. The maximum value for this setting is 100. | 10 | 
Relation Extraction Timeout | This sets the default amount of time, in seconds, to wait for a response from the Relation Extraction API call. A value of 0 indicates that the global AlchemyLanguage timeout setting should be used. | 0 | 


