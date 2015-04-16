# Watson Explorer Engine Converter for AlchemyLanguage API

[IBM Watson Explorer](http://www.ibm.com/smarterplanet/us/en/ibmwatson/explorer.html) combines search and content analytics with unique cognitive computing capabilities available through external cloud services such as [AlchemyAPI](http://www.alchemyapi.com/) and [Watson Developer Cloud](http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/) to help users find and understand the information they need to work more efficiently and make better, more confident decisions.  Watson Explorer Application Builder is the delivery tool that allows developers to quickly construct a 360-degree view combining data and analytics from many sources into a single view.

The AlchemyLanguage API is a set of web services that enable advanced text analysis including natural language parsing (NLP), sentiment analysis, entity extraction, and concept identification.  There are currently 12 AlchemyLanguage functions available.

* [Entity Extraction](http://www.alchemyapi.com/products/alchemylanguage/entity-extraction)
* [Sentiment Analysis](http://www.alchemyapi.com/products/alchemylanguage/sentiment-analysis)
* [Keyword Extraction](http://www.alchemyapi.com/products/alchemylanguage/keyword-extraction)
* [Concept Tagging](http://www.alchemyapi.com/products/alchemylanguage/concept-tagging)
* [Relation Extraction](http://www.alchemyapi.com/products/alchemylanguage/relation-extraction)
* [Taxonomy Classification](http://www.alchemyapi.com/products/alchemylanguage/taxonomy)
* [Author Extraction](http://www.alchemyapi.com/products/alchemylanguage/author-extraction)
* [Language Detection](http://www.alchemyapi.com/products/alchemylanguage/language-detection)
* [Text Extraction](http://www.alchemyapi.com/products/alchemylanguage/text-extraction)
* [Microformats Parsing](http://www.alchemyapi.com/products/alchemylanguage/microformats-parsing)
* [Feed Detection](http://www.alchemyapi.com/products/alchemylanguage/feed-detection)
* [Linked Data Support](http://www.alchemyapi.com/products/alchemylanguage/linked-data)

The [full AlchemyLanguage API reference is available on the AlchemyAPI website](http://www.alchemyapi.com/api).


# Using the Converter

The AlchemyLanguage Engine converter can be used during any document ingestion (push or crawl) to enrich indexed documents with additional metadata that might be used for a variety of purposes in the context of search or entity-360 use cases.

## Prerequisites

- **Watson Explorer Engine**.  This converter was tested against WEX Engine 10.2, but will probably work with any supported version of Watson Explorer Engine, Data Explorer Engine, or Vivisimo Velocity
- **AlchemyAPI Key**.  An API key can be obtained from AlchemyAPI, an IBM Company by [filling out a simple web form](http://www.alchemyapi.com/api/register.html).


## Adding the Converter to Engine

Follow these steps to add the converter to Engine.

1. In Engine, create a new XML Element.  The element and name can have any value.
2. Copy the entire contents of [function.vse-converter-alchemyapi-alchemylanguage.xml](/engine/function.vse-converter-alchemyapi-alchemylanguage.xml).
3. Paste the copied XML into the Engine XML text box, replacing all text that was previously there.
4. Save the converter configuration by clicking 'OK'

To use the AlchemyLanaguage converter in an Engine search collection, navigate to the collection's converter tab, add a new converter, and select the AlchemyLanguage Converter.  The converter function will be available in the collection's conversion pipeline and is now ready to be configured.

## Configuring the AlchemyLanguage Converter

The AlchemyLanguage converter requires a valid API key for use.  Individual Alchemy functions must be enabled and are each individual configured.  This allows you to, for example, use one set of content in one function and different content in another function.

The results of the AlchemyLanguage API request will be stored as XML nodes within the VSE document that will require further conversion to prepare as document content nodes.  No assumptions are made regarding content naming and it is the responsibility of the administrator to ensure desired content is retained and indexed.  This is easily accomplished with a custom converter.  Run a test-it to view the specific output of the converter.

A complete list of configuration options is available in the converter tool-tips and [converter summary page](/engine/alchemylanguage-converter-summary.md).

# Suggested Use Cases

The AlchemyLanguage API converter is intended to make it easier for Engine administrators to augment indexed content using AlchmeyLanguage web services.  An augmented index might be useful in a variety of situations.  Here are some examples to help get you started.

- Autoclassify documents using the AlchemyLanguage [Taxonomy Classification](http://www.alchemyapi.com/products/alchemylanguage/taxonomy) or [Concept Tagging](http://www.alchemyapi.com/products/alchemylanguage/concept-tagging) functions.  This taxonomy might be used for faceting, "find related" searches, display, or combined with other analytics.
- Enhance relevancy by extracting keywords or critical text using the [Keyword Extraction](http://www.alchemyapi.com/products/alchemylanguage/keyword-extraction), [Author Extraction](http://www.alchemyapi.com/products/alchemylanguage/author-extraction), or [Text Extraction](http://www.alchemyapi.com/products/alchemylanguage/text-extraction) functions.  Extracted content might be indexed in searchable, not displayable content and given higher weight to have a stronger influence on relevancy.
- Improve title detection with the [Text Extraction](http://www.alchemyapi.com/products/alchemylanguage/text-extraction) function.
- Extend language detection with the [Language Detection](http://www.alchemyapi.com/products/alchemylanguage/language-detection) function.  While Watson Explorer Engine has built in language detection for a number of languages, AlchemyLanguage brings detection for a variety of additional languages and dialects not directly supported by Engine including Cherokee, Fulfulde Adamawa, Haitian Creole, Hawaiian, and Low Saxon among others.
- Used [Linked Data](http://www.alchemyapi.com/products/alchemylanguage/linked-data) to expand the scope of knowled available to users beyond your document set by including information from publicly available data sources such as [DBpedia](http://wiki.dbpedia.org/), [Yago](http://www.mpi-inf.mpg.de/departments/databases-and-information-systems/research/yago-naga/yago/), [freebase](http://www.freebase.com/), among others.  Linked Data is returned with the [entity extraction](http://www.alchemyapi.com/products/alchemylanguage/entity-extraction), [concept tagging](http://www.alchemyapi.com/products/alchemylanguage/concept-tagging), and [relation extraction](http://www.alchemyapi.com/products/alchemylanguage/relation-extraction) functions.


# Implementation Considerations
The AlchemyLanguage converter makes a web request to the AlcheymAPI endpoint configured in the converter settings.  Under the covers, this is done byway of an AXL parser node.

- **Privacy and Security** - AlchemyLanguage will require a web services call. If privacy or security are a major concern, consider purchasing [AlchemyAPI on-premise](http://www.alchemyapi.com/products/products-overview) or using similar capabilities available in the Watson Explorer Analytical Components, run completely on-premise.
- **Crawl performance** - As the converter will be making web services calls to the AlchemyAPI cloud, document conversion will be slower compared to not using converters that call out to web services.  We anticipate that conversion performance will be comparable to using a System-T or Content Analytics converter but this is highly dependent on the network, data, and other factors.
- **Failures will happen** - All distributed systems are inherently unreliable and failures will inevitably occur when attempt to call out to AlchemyLanguage.  Carefully consider how failures should be handled at conversion time. Should the whole document fail? Is a partially indexed document without enriched metadata from AlchemyLanguage OK?
- **Managing development costs** - Every document and every AlchemyLanguage function used counts toward your [daily and monthly AlchemyAPI transaction limits](http://www.alchemyapi.com/products/pricing/alchemylanguage). We've created [a simple test server](/test/mock-server) that can return a canned API response.  This test server can be used during development to help manage development time and costs. Keep in mind that the current converter will make one API call per function.

## Caching Proxy
Given the considerations listed here, the use of a caching proxy is always recommended in a Production environment.  Using a caching proxy can speed up refreshes and recrawls in some situations, overcome some network failures, and in some cases may also allow you to reduce the total number of required AlchemyAPI transactions.


# Licensing
All sample code contained within this project repository or any subdirectories is licensed according to the terms of the MIT license, which can be viewed in the file license.txt.


# Open Source @ IBM
[Find more open source projects on the IBM Github Page](http://ibm.github.io/)
