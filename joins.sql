SELECT count(id) FROM tickets;

SELECT count(DISTINCT customer_id) FROM tickets;



SELECT count(DISTINCT tickets.customer_id)::float / count(DISTINCT customers.id)::float * 100 AS percent
FROM customers LEFT JOIN tickets ON customers.id = tickets.customer_id;

SELECT count(distinct customers.id) as distinct_ids_count, count(customers.id) as id_count
from customers LEFT JOIN tickets on customers.id = tickets.customer_id;

SELECT count(distinct customers.id) as distinct_ids_count, count(customers.id) as id_count
from customers;

SELECT events.name AS event_name, count(tickets.id) AS number_of_tickets
FROM events RIGHT JOIN tickets ON events.id = tickets.event_id
GROUP BY event_name
ORDER BY number_of_tickets DESC;

return c.id, c.email, count(events.id) for all customers with tickets to more than 3 events

SELECT customers.id AS user_id, customers.email AS email, count(DISTINCT tickets.event_id) as ticket_count
FROM customers JOIN tickets on customers.id = tickets.customer_id
JOIN events on tickets.event_id = events.id
GROUP BY user_id
HAVING count(Distinct tickets.event_id) >= 3;


SELECT events.name AS event, events.starts_at, sections.name AS section, seats.row, seats.number AS SEAT FROM
customers JOIN tickets on customers.id = tickets.customer_id
JOIN events on tickets.event_id = events.id
JOIN seats on tickets.seat_id = seats.id
JOIN sections on seats.section_id = sections.id
WHERE customers.email = 'gennaro.rath@mcdermott.co';
