# SQL as Search: Learning to Rank

This project implements a multi-stage ranking framework in SQL that demonstrates how to build a production-grade search system. It combines a pre-filter stage for fast retrieval with composite ranking and re-ranking stages to surface the most relevant results. The example uses product search with category filtering, price validation, and a composite score that balances rating quality with review volume to identify top products for users.

While this approach is demonstrated with product search, the same multi-stage ranking pattern can be applied to chat systems for contextual message retrieval and relevance scoring. A chat system implementation that leverages this framework is planned as a future project.

For now, I'll point to the gandalf password game which demonstrates this. 

https://gandalf.lakera.ai/

The Gandalf password game is a practical illustration of how multi-stage defense mechanisms work in AI systems. It extends the core generation step by layering input filters that sanitize and validate user prompts before processing, and output reshapers that transform the generated response to comply with security constraints. This defense-in-depth approach mirrors the ranking framework's philosophy: each stage serves a specific purpose, from initial filtering to final refinement, creating a robust system that's harder to circumvent through single attack vectors.