import unittest
from wsdb import WSDB



class TestWSDBClient(unittest.TestCase):

    def setUp(self):
        self.client = WSDB()

    def tearDown(self):
        self.client.close()



class TestWSDBCatalogues(TestWSDBClient):

    def test_catalogue_name_retrieval(self):
        """
        Retrieve the catalogues available in the WSDB.
        """
        catalogue_names = self.client.catalogues

        self.assertIsNotNone(catalogue_names)
        self.assertIsInstance(catalogue_names, tuple)

        # We should have at least one catalogue in the WSDB for tests to pass.
        # TODO: revisit this?
        self.assertTrue(len(catalogue_names) > 0)

        self.assertEqual(len(set(catalogue_names)), len(catalogue_names))

        for catalogue_name in catalogue_names:
            self.assertIsInstance(catalogue_name, (str, unicode))


        