from langchain.prompts.example_selector import SemanticSimilarityExampleSelector
from langchain.vectorstores import FAISS
from langchain.embeddings import OpenAIEmbeddings
from langchain.prompts import MaxMarginalRelevanceExampleSelector


def get_semantic_similarity_example_selector(api_key, _example_db_tasks, number_of_similar_tasks):
    return SemanticSimilarityExampleSelector.from_examples(
        # This is the list of examples available to select from.
        _example_db_tasks,
        # This is the embedding class used to produce embeddings which are used to measure semantic similarity.
        OpenAIEmbeddings(openai_api_key=api_key),
        # This is the VectorStore class that is used to store the embeddings and do a similarity search over.
        FAISS,
        # This is the number of examples to produce.
        k=number_of_similar_tasks
    )


def get_max_marginal_relevance_based_example_selector(api_key, _example_db_tasks, number_of_similar_tasks):
    return MaxMarginalRelevanceExampleSelector.from_examples(
        # This is the list of examples available to select from.
        _example_db_tasks,
        # This is the embedding class used to produce embeddings which are used to measure semantic similarity.
        OpenAIEmbeddings(openai_api_key=api_key),
        # This is the VectorStore class that is used to store the embeddings and do a similarity search over.
        FAISS,
        # This is the number of examples to produce.
        k=number_of_similar_tasks,
    )
