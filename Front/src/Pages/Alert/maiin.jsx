import React, { useEffect, useState } from 'react';
import API_BASE_URL from '../../config';

const Main = () => {
    const [alerts, setAlerts] = useState([]);

    useEffect(() => {
        const fetchAlerts = async () => {
            try {
                const response = await fetch(`${API_BASE_URL}/api/Opportunity/sendAlert`);
                const data = await response.json();
                console.log(data);
                setAlerts(data);
            } catch (error) {
                console.error('Error fetching alerts:', error);
            }
        };

        fetchAlerts();
    }, []);

    const acknowledgeAlert = async (id) => {
        try {
            await fetch(`${API_BASE_URL}/api/Opportunity/acknowledge`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ id }),
            });

            setAlerts((prevAlerts) => prevAlerts.filter((alert) => alert.id !== id));
        } catch (error) {
            console.error('Error acknowledging alert:', error);
        }
    };

    return (
        <div className="h-screen flex-1 p-7">
            <h1 className="text-2xl font-semibold text-center">Alerts</h1>
            {alerts.length === 0 ? (
                <p className="text-xl p-7 text-center">No alerts present</p>
            ) : (
                <ul>
                    {alerts.map((alert) => (
                        <li key={alert.id}>
                            {`${alert.alert_entity} - ${alert.alert_description} - ${alert.license_to} - ${alert.alert_type} ${alert.daysLeft} `} 

                            <button onClick={() => acknowledgeAlert(alert.id)}>Acknowledge</button>
                        </li>
                    ))}
                </ul>
            )}
        </div>
    );
};

export default Main;
